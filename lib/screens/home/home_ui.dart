import 'package:ebook_app/components/book_card.dart';
import 'package:ebook_app/components/book_list_item.dart';
import 'package:ebook_app/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../components/body_builder.dart';
import '../../models/category.dart';

var controller = Get.find<HomeController>();

Widget homeUI() => Scaffold(body: _buildBody());

Widget _buildBody() => Obx((() => BodyBuilder(
      apiRequestStatus: controller.apiRequestStatus.value,
      child: _buildBodyList(),
      reload: () => controller.getFeeds(),
    )));

Widget _buildBodyList() {
  return RefreshIndicator(
    onRefresh: () async => await controller.refreshData(),
    child: Padding(
      padding: EdgeInsets.only(top: 4.0.h),
      child: ListView(
        children: <Widget>[
          const SizedBox(height: 20.0),
          _buildSectionTitle('Popular'),
          const SizedBox(height: 20.0),
          _buildFeaturedSection(),
          const SizedBox(height: 20.0),
          _buildSectionTitle('Categories'),
          const SizedBox(height: 10.0),
          _buildGenreSection(),
          const SizedBox(height: 20.0),
          _buildSectionTitle('Recently Added'),
          const SizedBox(height: 20.0),
          _buildNewSection(),
        ],
      ),
    ),
  );
}

_buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

_buildFeaturedSection() {
  return SizedBox(
    height: 200.0,
    child: Center(
      child: ListView.builder(
        primary: false,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        scrollDirection: Axis.horizontal,
        itemCount: controller.top.value.feed?.entry?.length ?? 0,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          Entry entry = controller.top.value.feed!.entry![index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            child: _bookComponent(
              entry.link![1].href!,
              entry,
            ),
          );
        },
      ),
    ),
  );
}

_bookComponent(String img, Entry entry) => bookCardUI(
      img: img,
      entry: entry,
    );

_buildGenreSection() {
  return SizedBox(
    height: 50.0,
    child: Center(
      child: ListView.builder(
        primary: false,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        scrollDirection: Axis.horizontal,
        itemCount: controller.top.value.feed?.link?.length ?? 0,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          Link link = controller.top.value.feed!.link![index];

          // We don't need the tags from 0-9 because
          // they are not categories
          if (index < 10) {
            return const SizedBox();
          }

          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
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
                onTap: () => controller.routeToGenrePage(
                  title: '${link.title}',
                  url: link.href!,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      '${link.title}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}

_buildNewSection() {
  return ListView.builder(
    primary: false,
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: controller.recent.value.feed?.entry?.length ?? 0,
    itemBuilder: (BuildContext context, int index) {
      Entry entry = controller.recent.value.feed!.entry![index];

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: _bookListItem(
          entry: entry,
        ),
      );
    },
  );
}

_bookListItem({required Entry entry}) => bookListItemUI(
      entry: entry,
    );
