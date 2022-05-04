import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  final bool isImage;

  const LoadingWidget({Key? key, this.isImage = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    if (isImage) {
      return SpinKitFadingCircle(
        size: 20,
        color: Theme.of(context).colorScheme.secondary,
      );
    } else {
      return SpinKitFoldingCube(
        color: Theme.of(context).colorScheme.secondary,
      );
    }
  }
}
