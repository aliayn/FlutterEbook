import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';
import 'custom_alert.dart';

var _received = 0.obs;
var _progress = '0'.obs;
var _total = 0.obs;

Widget downloadAlert({required url,required path}) => GetX(
      initState: _download(url, path),
      builder: ((controller) => WillPopScope(
            onWillPop: () => Future.value(false),
            child: customAlert(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      'Downloading...',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      height: 5,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Builder(builder: (context) {
                        return LinearProgressIndicator(
                          value: double.parse(_progress.value) / 100.0,
                          valueColor: AlwaysStoppedAnimation(
                              Theme.of(context).colorScheme.secondary),
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.3),
                        );
                      }),
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '$_progress %',
                          style: const TextStyle(
                            fontSize: 13.0,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${formatBytes(_received, 1)} '
                          'of ${formatBytes(_total, 1)}',
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
            ),
          )),
    );

_download(url, path) async {
  await Dio().download(
    url,
    path,
    deleteOnError: true,
    onReceiveProgress: (receivedBytes, totalBytes) {
      _received(receivedBytes);
      _total(totalBytes);
      _progress((_received / _total.value * 100).toStringAsFixed(0));

      //Check if download is complete and close the alert dialog
      if (receivedBytes == totalBytes) {
        Get.back(result: '${formatBytes(_total, 1)}');
      }
    },
  );
}
