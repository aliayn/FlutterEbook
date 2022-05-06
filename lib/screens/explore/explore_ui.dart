import 'package:ebook_app/controllers/explore/explore_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../components/body_builder.dart';
import '../../components/book_card.dart';
import '../../components/loading_widget.dart';
import '../../controllers/home/home_controller.dart';
import '../../models/category.dart';

final _homeController = Get.find<HomeController>();
final _exploreController = Get.find<ExploreController>();

Widget exploreUI() => Scaffold(
      body: _buildBody(),
    );

Widget _buildBody() => Obx((() => BodyBuilder(
      apiRequestStatus: _homeController.apiRequestStatus.value,
      child: _buildBodyList(),
      reload: () => _homeController.getFeeds(),
    )));

_buildBodyList() {
  return RefreshIndicator(
    onRefresh: () async => await _homeController.refreshData(),
    child: Padding(
      padding: EdgeInsets.only(top: 4.0.h),
      child: ListView.builder(
        itemCount: _homeController.top.value.feed?.link?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          Link link = _homeController.top.value.feed!.link![index];

          // We don't need the tags from 0-9 because
          // they are not categories
          if (index < 10) {
            return const SizedBox();
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: <Widget>[
                _buildSectionHeader(link),
                const SizedBox(height: 10.0),
                _buildSectionBookList(link),
              ],
            ),
          );
        },
      ),
    ),
  );
}

_buildSectionHeader(Link link) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: Text(
            '${link.title}',
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        GestureDetector(
          onTap: () {
            _exploreController.routeToGenre('${link.title}', link.href!);
          },
          child: Builder(builder: (context) {
            return Text(
              'See All',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w400,
              ),
            );
          }),
        ),
      ],
    ),
  );
}

_buildSectionBookList(Link link) {
  return FutureBuilder<CategoryFeed>(
    future: _exploreController.getCategory(link.href!),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done &&
          snapshot.hasData) {
        CategoryFeed category = snapshot.data!;

        return SizedBox(
          height: 200.0,
          child: Center(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              scrollDirection: Axis.horizontal,
              itemCount: category.feed!.entry!.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                Entry entry = category.feed!.entry![index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 10.0,
                  ),
                  child: bookCardUI(
                    img: entry.link![1].href!,
                    entry: entry,
                  ),
                );
              },
            ),
          ),
        );
      } else {
        return const SizedBox(
          height: 200.0,
          child: LoadingWidget(),
        );
      }
    },
  );
}
