import 'package:flutter/cupertino.dart';

const kDefaultPadding = 20.0;

double getHeight(context) {
  double height = MediaQuery.of(context).size.height;
  return height;
}

double getWidth(context) {
  double width = MediaQuery.of(context).size.width;
  return width;
}
