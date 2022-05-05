import 'dart:async';

import 'package:ebook_app/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/category.dart';
import '../../utils/api_request_status.dart';

class GenreController extends BaseController {
  ScrollController scrollController = ScrollController();
  var apiRequestStatus = APIRequestStatus.loading.obs;
  var items = [].obs;
  int page = 1;
  var loadingMore = false.obs;
  var loadMore = true.obs;

  getFeed(String url) async {
    apiRequestStatus(APIRequestStatus.loading);
    try {
      CategoryFeed feed = await provider.getCustomApi(url);
      items(feed.feed!.entry!);
      apiRequestStatus(APIRequestStatus.loaded);
      _listener(url);
    } catch (e) {
      checkError(apiRequestStatus, e);
    }
  }

  _listener(url) {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!loadingMore.value) {
          _paginate(url);
          // Animate to bottom of list
          Timer(const Duration(milliseconds: 100), () {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn,
            );
          });
        }
      }
    });
  }

  _paginate(String url) async {
    if (apiRequestStatus.value != APIRequestStatus.loading &&
        !loadingMore.value &&
        loadMore.value) {
      Timer(const Duration(milliseconds: 100), () {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      });
      page = page + 1;
      loadingMore(true);
      try {
        CategoryFeed feed = await provider.getCustomApi(url + '&page=$page');
        items.addAll(feed.feed!.entry!);
        loadingMore(false);
      } catch (e) {
        loadMore(false);
        loadingMore(false);
      }
    }
  }
}
