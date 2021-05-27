import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'app/app_widget.dart';

void main() {
  //Removing # from url
  setPathUrlStrategy();
  runApp(MyApp());
}
