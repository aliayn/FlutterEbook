import 'package:flutter/material.dart';
import 'package:get/get.dart';

var _flag = true.obs;

Widget descriptionText({required text}) => Builder(builder: (context) {
      late String firstHalf;
      late String secondHalf;
      if (text.length > 300) {
        firstHalf = text.substring(0, 300);
        secondHalf = text.substring(300, text.length);
      } else {
        firstHalf = text;
        secondHalf = '';
      }
      return Obx(
        (() => Container(
              child: secondHalf.isEmpty
                  ? Text(
                      (_flag.value ? (firstHalf) : (firstHalf + secondHalf))
                          .replaceAll(r'\n', '\n')
                          .replaceAll(r'\r', '')
                          .replaceAll(r"\'", "'"),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).textTheme.caption!.color,
                      ),
                    )
                  : Column(
                      children: <Widget>[
                        Text(
                          (_flag.value
                                  ? (firstHalf + '...')
                                  : (firstHalf + secondHalf))
                              .replaceAll(r'\n', '\n\n')
                              .replaceAll(r'\r', '')
                              .replaceAll(r"\'", "'"),
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Theme.of(context).textTheme.caption!.color,
                          ),
                        ),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                _flag.value ? 'show more' : 'show less',
                                style: const TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                          onTap: () => _flag(!_flag.value),
                        ),
                      ],
                    ),
            )),
      );
    });
