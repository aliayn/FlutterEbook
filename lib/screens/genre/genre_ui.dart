import 'package:ebook_app/controllers/genre/genre_controller.dart';
import 'package:ebook_app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/body_builder.dart';
import '../../components/book_list_item.dart';
import '../../components/loading_widget.dart';
import '../../models/category.dart';

var _controller = Get.find<GenreController>();

Widget genreUI(arguments) => Scaffold(
      body: _buildBody(arguments),
    );

Widget _buildBody(arguments) => Obx(
      () {
        _controller.getFeed(arguments[0][url]);
        return BodyBuilder(
          apiRequestStatus: _controller.apiRequestStatus.value,
          child: _buildBodyList(),
          reload: () => _controller.getFeed(arguments[0][url]),
        );
      },
    );

_buildBodyList() {
  return ListView(
    controller: _controller.scrollController,
    children: <Widget>[
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        shrinkWrap: true,
        itemCount: _controller.items.length,
        itemBuilder: (BuildContext context, int index) {
          Entry entry = _controller.items[index];
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: BookListItem(
              entry: entry,
            ),
          );
        },
      ),
      const SizedBox(height: 10.0),
      _controller.loadingMore.value
          ? SizedBox(
              height: 80.0,
              child: _buildProgressIndicator(),
            )
          : const SizedBox(),
    ],
  );
}

_buildProgressIndicator() => const LoadingWidget();
