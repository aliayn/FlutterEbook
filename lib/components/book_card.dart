import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/components/loading_widget.dart';
import 'package:ebook_app/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/category.dart';

const uuid = Uuid();
final String imgTag = uuid.v4();
final String titleTag = uuid.v4();
final String authorTag = uuid.v4();

Widget bookCardUI({required String img, required Entry entry}) => SizedBox(
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
              imgTag: imgTag,
              titleTag: titleTag,
              authorTag: authorTag,
            );
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            child: Hero(
              tag: imgTag,
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
