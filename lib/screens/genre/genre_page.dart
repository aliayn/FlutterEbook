import 'package:ebook_app/screens/genre/genre_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenrePage extends StatelessWidget {
  const GenrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => genreUI(Get.arguments);
}
