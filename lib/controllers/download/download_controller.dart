import 'dart:convert';
import 'dart:io';

import 'package:ebook_app/base/base_controller.dart';
import 'package:ebook_app/models/downloads.dart';
import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/locator.dart';

class DownloadController extends BaseController {
  var downloads = <Downloads>[].obs;

  getDownloads() async => downloads.assignAll(await provider.getAllDownloads());

  openBook(index, context) async {
    var download = downloads[index];
    String path = download.path;
    var locator = await provider.findLocator(download.id);

    EpubViewer.setConfig(
      identifier: 'androidBook',
      themeColor: Theme.of(context).colorScheme.secondary,
      scrollDirection: EpubScrollDirection.VERTICAL,
      enableTts: false,
      allowSharing: true,
    );
    EpubViewer.open(path,
        lastLocation: locator != null
            ? EpubLocator.fromJson(jsonDecode(locator.data))
            : null);
    EpubViewer.locatorStream.listen((event) async {
      // Get locator here
      Map json = jsonDecode(event);
      json['bookId'] = download.id;
      var locator = Locator(id: download.id, data: jsonEncode(json));
      // Save locator to your database
      await provider.insetLocator(locator);
    });
  }

  deleteBook(int index) {
    var download = downloads[index];
    provider.deleteDownload(download.id).then((v) async {
      File f = File(download.path);
      if (await f.exists()) {
        f.delete();
      }
    });
    downloads.removeAt(index);
  }
}
