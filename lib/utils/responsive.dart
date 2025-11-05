import 'package:flutter/material.dart';

class Responsive {
  final Size size;

  Responsive(this.size);

  double wp(double percent) => size.width * (percent / 100);
  double hp(double percent) => size.height * (percent / 100);

  double sp(double sizeValue) {
    // TextScaleFactor biar teks juga adaptif
    double baseWidth = 411; // referensi lebar Pixel 2 XL (standar umum Flutter)
    return size.width / baseWidth * sizeValue;
  }
}
