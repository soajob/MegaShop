import 'package:flutter/material.dart';
import 'package:mega_shop/screens/home/home_screen.dart';

import 'common/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: textColorDarkCommon
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen()
    );
  }
}
