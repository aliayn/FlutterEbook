import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/components/book_list_item.dart';
import 'package:ebook_app/components/loading_widget.dart';
import 'package:ebook_app/controllers/detail/detail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sizer/sizer.dart';

import '../../components/body_builder.dart';
import '../../components/description_text.dart';
import '../../models/category.dart';

Widget detailUI(arguments) => _buildUI(arguments);

_buildUI(arguments) {
  var url = arguments[0].author!.uri!.t!.replaceAll(r'\&lang=en', '');
  var imgTag = arguments[1];
  var titleTag = arguments[2];
  var authorTag = arguments[3];

  return GetX<DetailController>(initState: (state) {
    state.controller?.entry(arguments[0]);
    state.controller?.getFeed(url);
  }, builder: ((controller) {
    controller.faved.value;
    controller.downloaded.value;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if (controller.faved.value) {
                controller.removeFav();
              } else {
                controller.addFav();
              }
            },
            icon: Builder(
                builder: (context) => Icon(
                      controller.faved.value
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      color: controller.faved.value
                          ? Colors.red
                          : Theme.of(context).primaryColor,
                    )),
          ),
          IconButton(
            onPressed: () => controller.share(),
            icon: const Icon(
              CupertinoIcons.share,
            ),
          ),
        ],
      ),
      body: _buildBody(controller, url, imgTag, titleTag, authorTag),
    );
  }));
}

_buildBody(DetailController controller, url, imgTag, titleTag, authorTag) =>
    ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      children: <Widget>[
        const SizedBox(height: 10.0),
        _buildImageTitleSection(controller, imgTag, titleTag, authorTag),
        const SizedBox(height: 30.0),
        _buildSectionTitle('Book Description'),
        _buildDivider(),
        const SizedBox(height: 10.0),
        descriptionText(
          text: '${controller.entry.value.summary!.t}',
        ),
        const SizedBox(height: 30.0),
        _buildSectionTitle('More from Author'),
        _buildDivider(),
        const SizedBox(height: 10.0),
        _buildMoreBook(controller, url),
      ],
    );

_buildDivider() {
  return Builder(
      builder: (context) => Divider(
            color: Theme.of(context).textTheme.caption!.color,
          ));
}

_buildImageTitleSection(
    DetailController controller, imgTag, titleTag, authorTag) {
  return Builder(
      builder: (context) => Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: imgTag,
                child: CachedNetworkImage(
                  imageUrl: '${controller.entry.value.link![1].href}',
                  placeholder: (context, url) => const SizedBox(
                    height: 200.0,
                    width: 130.0,
                    child: LoadingWidget(),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(CupertinoIcons.clear_thick),
                  fit: BoxFit.cover,
                  height: 200.0,
                  width: 130.0,
                ),
              ),
              const SizedBox(width: 20.0),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 5.0),
                    Hero(
                      tag: titleTag,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(
                          controller.entry.value.title!.t!.replaceAll(r'\', ''),
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 3,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Hero(
                      tag: authorTag,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(
                          '${controller.entry.value.author!.name!.t}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    _buildCategory(controller.entry.value, context),
                    Center(
                      child: SizedBox(
                        height: 30.0,
                        width: 100.w,
                        child: _createDownloadReadButton(controller),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ));
}

_buildSectionTitle(String title) {
  return Builder(
      builder: (context) => Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ));
}

_buildMoreBook(DetailController controller, url) => BodyBuilder(
      apiRequestStatus: controller.apiRequestStatus.value,
      child: _buildBodyList(controller),
      reload: () => controller.refreshFeed(url),
    );

_buildBodyList(DetailController controller) {
  try {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.related.value.feed!.entry!.length,
      itemBuilder: (BuildContext context, int index) {
        Entry entry = controller.related.value.feed!.entry![index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: bookListItemUI(
            entry: entry,
          ),
        );
      },
    );
  } catch (e) {
    return Builder(
        builder: (context) => SizedBox(
              height: 100,
              child: Text(
                'There is no more Book!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline6!.color,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ));
  }
}

_createDownloadReadButton(DetailController controller) {
  return Builder(
      builder: (context) => controller.downloaded.value
          ? _buildDownloadReadButton(
              'Read Book', () => controller.openBook(context))
          : _buildDownloadReadButton(
              'Download Book', () => controller.downloadFile(context)));
}

Widget _buildDownloadReadButton(title, Function() function) =>
    Builder(builder: (context) {
      return SizedBox(
        width: 40,
        height: 50,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              onTap: function,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });

_buildCategory(Entry entry, context) {
  if (entry.category == null) {
    return const SizedBox();
  } else {
    return SizedBox(
      height: entry.category!.length < 3 ? 55.0 : 95.0,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: entry.category!.length > 4 ? 4 : entry.category!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 210 / 80,
        ),
        itemBuilder: (BuildContext context, int index) {
          Category cat = entry.category![index];
          return Padding(
            padding: const EdgeInsets.only(
                left: 0.0, top: 5.0, right: 5.0, bottom: 5.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text(
                    '${cat.label}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: cat.label!.length > 18 ? 6.0 : 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
