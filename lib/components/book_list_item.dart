import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/category.dart';
import '../routes/router.dart';
import 'loading_widget.dart';

const uuid = Uuid();
final String _imgTag = uuid.v4();
final String _titleTag = uuid.v4();
final String _authorTag = uuid.v4();

Widget bookListItemUI({required Entry entry}) => Builder(builder: (context) => InkWell(
        onTap: () => geToDetailPage(
            entry: entry,
            imgTag: _imgTag,
            titleTag: _titleTag,
            authorTag: _authorTag,
          ),
        child: SizedBox(
          height: 150.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                elevation: 4,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  child: Hero(
                    tag: _imgTag,
                    child: CachedNetworkImage(
                      imageUrl: entry.link![1].href!,
                      placeholder: (context, url) => const SizedBox(
                        height: 150.0,
                        width: 100.0,
                        child: LoadingWidget(
                          isImage: true,
                        ),
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/images/place.png',
                        fit: BoxFit.cover,
                        height: 150.0,
                        width: 100.0,
                      ),
                      fit: BoxFit.cover,
                      height: 150.0,
                      width: 100.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: _titleTag,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(
                          entry.title!.t!.replaceAll(r'\', ''),
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.headline6!.color,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Hero(
                      tag: _authorTag,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(
                          entry.author!.name!.t!,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      '${entry.summary!.t!.length < 100 ? entry.summary!.t! : entry.summary!.t!.substring(0, 100)}...'
                          .replaceAll(r'\n', '\n')
                          .replaceAll(r'\r', '')
                          .replaceAll(r'\"', '"'),
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Theme.of(context).textTheme.caption!.color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
