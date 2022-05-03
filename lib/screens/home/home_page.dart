import 'package:ebook_app/controllers/home/home_controller.dart';
import 'package:ebook_app/screens/home/home_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => homeUI();
}