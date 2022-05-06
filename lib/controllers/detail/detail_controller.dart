import 'dart:convert';
import 'dart:io';

import 'package:ebook_app/base/base_controller.dart';
import 'package:ebook_app/components/download_alert.dart';
import 'package:ebook_app/models/downloads.dart';
import 'package:ebook_app/models/favorite.dart';
import 'package:ebook_app/models/locator.dart';
import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:path_provider/path_provider.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import '../../models/category.dart';
import '../../utils/api_request_status.dart';
import '../../utils/const.dart';

class DetailController extends BaseController {
  var apiRequestStatus = APIRequestStatus.loading.obs;
  var related = CategoryFeed().obs;
  late Rx<Entry> entry;
  var faved = false.obs;
  var downloaded = false.obs;

  getFeed(String url) async {
    apiRequestStatus(APIRequestStatus.loading);
    await _checkFav();
    await _checkDownload();
    try {
      CategoryFeed feed = await provider.getCustomApi(url);
      related(feed);
      apiRequestStatus(APIRequestStatus.loaded);
    } catch (e) {
      checkError(apiRequestStatus, e);
    }
  }

  _checkFav() async {
    var favorite = await provider.findFavorite(entry.value.id!.t.toString());
    if (favorite != null) {
      faved(true);
    } else {
      faved(false);
    }
  }

  _checkDownload() async {
    var download = await provider.findDownload(entry.value.id!.t.toString());
    if (download != null) {
      // check if book has been deleted
      String path = download.path;
      if (await File(path).exists()) {
        downloaded(true);
      } else {
        downloaded(false);
      }
    } else {
      downloaded(false);
    }
  }

  Future downloadFile(context) async {
    PermissionStatus permission = await Permission.storage.status;
    String url = entry.value.link![3].href!;
    String filename =
        entry.value.title!.t!.replaceAll(' ', '_').replaceAll(r"\'", "'");

    if (permission != PermissionStatus.granted) {
      await Permission.storage.request();
      // access media location needed for android 10/Q
      await Permission.accessMediaLocation.request();
      // manage external storage needed for android 11/R
      await Permission.manageExternalStorage.request();
      startDownload(context, url, filename);
    } else {
      startDownload(context, url, filename);
    }
  }

  startDownload(context, url, filename) async {
    Directory? appDocDir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    if (Platform.isAndroid) {
      Directory(appDocDir!.path.split('Android')[0] + appName).createSync();
    }

    String path = Platform.isIOS
        ? appDocDir!.path + '/$filename.epub'
        : appDocDir!.path.split('Android')[0] + '$appName/$filename.epub';

    File file = File(path);
    if (!await file.exists()) {
      await file.create();
    } else {
      await file.delete();
      await file.create();
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => downloadAlert(
        url: url,
        path: path,
      ),
    ).then((v) {
      // When the download finishes, we then add the book
      // to our local database
      if (v != null) {
        _addDownload(Downloads(
            id: entry.value.id!.t.toString(),
            path: path,
            image: '${entry.value.link![1].href}',
            size: v,
            name: entry.value.title!.t ?? ''));
      }
    });
  }

  _addDownload(Downloads download) async {
    await provider.deleteDownload(download.id);
    await provider.insetDownload(download);
    _checkDownload();
  }

  removeFav() async {
    await provider.deleteFavorite(entry.value.id!.t.toString());
    _checkFav();
  }

  addFav() async {
    await provider.insetFavorite(Favorite(
        id: entry.value.id!.t.toString(),
        item: entry.value.toJson().toString()));
    _checkFav();
  }

  share() {
    Share.share('${entry.value.title!.t} by ${entry.value.author!.name!.t}'
        'Read/Download ${entry.value.title!.t} from ${entry.value.link![3].href}.');
  }

  openBook(context) async {
    var download = await provider.findDownload(entry.value.id!.t.toString());
    var locator = await provider.findLocator(entry.value.id!.t!.toString());
    if (download != null && locator != null) {
      String path = download.path;

      EpubViewer.setConfig(
        identifier: 'androidBook',
        themeColor: Theme.of(context).colorScheme.secondary,
        scrollDirection: EpubScrollDirection.VERTICAL,
        enableTts: false,
        allowSharing: true,
      );
      EpubViewer.open(path,
          lastLocation: EpubLocator.fromJson(jsonDecode(locator.data)));
      EpubViewer.locatorStream.listen((event) async {
        // Get locator here
        var bookID = entry.value.id!.t!.toString();
        Map json = jsonDecode(event);
        json['bookId'] = bookID;
        var locator = Locator(id: bookID, data: json.toString());
        // Save locator to your database
        await provider.insetLocator(locator);
      });
    }
  }
}
