import 'package:ebook_app/controllers/explore/explore_controller.dart';
import 'package:ebook_app/screens/explore/explore_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ExplorePage extends GetView<ExploreController> {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => exploreUI();
}
