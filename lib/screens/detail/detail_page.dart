import 'package:ebook_app/screens/detail/detail_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => detailUI(Get.arguments);
}
