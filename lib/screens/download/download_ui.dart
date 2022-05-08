import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/components/loading_widget.dart';
import 'package:ebook_app/controllers/download/download_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:uuid/uuid.dart';

Widget downloadUI() => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Downloads'),
      ),
      body: GetX<DownloadController>(
          initState: ((state) => state.controller?.getDownloads()),
          builder: ((controller) => controller.downloads.isEmpty
              ? _buildEmptyListView()
              : _buildBodyList(controller))),
    );

_buildBodyList(DownloadController controller) {
  const uuid = Uuid();
  return ListView.separated(
    shrinkWrap: true,
    itemCount: controller.downloads.length,
    itemBuilder: (BuildContext context, int index) {
      return Dismissible(
        key: ObjectKey(uuid.v4()),
        direction: DismissDirection.endToStart,
        background: _dismissibleBackground(),
        onDismissed: (d) => controller.deleteBook(index),
        child: InkWell(
          onTap: () => controller.openBook(index, context),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Row(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: controller.downloads[index].image,
                  placeholder: (context, url) => const SizedBox(
                    height: 70.0,
                    width: 70.0,
                    child: LoadingWidget(),
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/images/place.png',
                    fit: BoxFit.cover,
                    height: 70.0,
                    width: 70.0,
                  ),
                  fit: BoxFit.cover,
                  height: 70.0,
                  width: 70.0,
                ),
                const SizedBox(width: 10.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        controller.downloads[index].name,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'COMPLETED',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            controller.downloads[index].size,
                            style: const TextStyle(
                              fontSize: 13.0,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );
}

_buildEmptyListView() => Center(
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

_dismissibleBackground() => Container(
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.only(right: 20.0),
    color: Colors.red,
    child: const Icon(
      CupertinoIcons.trash,
      color: Colors.white,
    ),
  );
