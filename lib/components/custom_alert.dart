import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget customAlert({required Widget child}) =>  MediaQuery(
      data: const MediaQueryData(),
      child: GestureDetector(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 0.5,
            sigmaY: 0.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        width:  90.w,
                        child: GestureDetector(
                          onTap: () {},
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            child: child,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
