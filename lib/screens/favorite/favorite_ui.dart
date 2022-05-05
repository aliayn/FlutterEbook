import 'dart:convert';

import 'package:ebook_app/controllers/favorite/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/book.dart';
import '../../models/category.dart';

final _controller = Get.find<FavoriteController>();

Widget favoriteUI() => Scaffold(body: _createBody());

_createBody() => Obx(() {
      if (_controller.favorites.isEmpty) {
        return _buildEmptyListView();
      } else {
        return _buildGridView();
      }
    });

_buildEmptyListView() {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          'assets/images/empty.png',
          height: 300.0,
          width: 300.0,
        ),
        const Text(
          'Nothing is here',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

_buildGridView() {
  return GridView.builder(
    padding:
        const EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0, bottom: 0.0),
    shrinkWrap: true,
    itemCount: _controller.favorites.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 200 / 340,
    ),
    itemBuilder: (BuildContext context, int index) {
      Entry entry =
          Entry.fromJson(jsonDecode(_controller.favorites[index].item));
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: BookItem(
          img: entry.link![1].href!,
          title: entry.title!.t!,
          entry: entry,
        ),
      );
    },
  );
}