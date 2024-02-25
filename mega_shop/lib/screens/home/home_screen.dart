import 'package:flutter/material.dart';

import '../../common/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textColorDarkCommon,
        title: const Text(appName, style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
