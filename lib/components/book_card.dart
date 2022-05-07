import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/components/loading_widget.dart';
import 'package:ebook_app/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/category.dart';

Widget bookCardUI({required String img, required Entry entry}) {
  const uuid = Uuid();
  final String _imgTag = uuid.v4();
  final String _titleTag = uuid.v4();
  final String _authorTag = uuid.v4();
  return SizedBox(
    width: 120.0,
    child: Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      elevation: 4.0,
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        onTap: () {
          geToDetailPage(
            entry: entry,
            imgTag: _imgTag,
            titleTag: _titleTag,
            authorTag: _authorTag,
          );
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          child: Hero(
            tag: _imgTag,
            child: CachedNetworkImage(
              imageUrl: img,
              placeholder: (context, url) => const LoadingWidget(
                isImage: true,
              ),
              errorWidget: (context, url, error) => Image.asset(
                'assets/images/place.png',
                fit: BoxFit.cover,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ),
  );
}
