import 'package:ebook_app/controllers/genre/genre_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/body_builder.dart';
import '../../components/book_list_item.dart';
import '../../components/loading_widget.dart';
import '../../models/category.dart';

Widget genreUI(arguments) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('${arguments[0]}'),
    ),
    body: _buildBody(arguments),
  );
}

Widget _buildBody(arguments) {
  return GetX<GenreController>(
      initState: ((state) => state.controller?.getFeed(arguments[1])),
      builder: ((controller) => BodyBuilder(
            apiRequestStatus: controller.apiRequestStatus.value,
            child: _buildBodyList(controller),
            reload: () => controller.getFeed(arguments[1]),
          )));
}

_buildBodyList(controller) {
  return ListView(
    controller: controller.scrollController,
    children: <Widget>[
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        shrinkWrap: true,
        itemCount: controller.items.length,
        itemBuilder: (BuildContext context, int index) {
          Entry entry = controller.items[index];
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: bookListItemUI(
              entry: entry,
            ),
          );
        },
      ),
      const SizedBox(height: 10.0),
      controller.loadingMore.value
          ? SizedBox(
              height: 80.0,
              child: _buildProgressIndicator(),
            )
          : const SizedBox(),
    ],
  );
}

_buildProgressIndicator() => const LoadingWidget();
