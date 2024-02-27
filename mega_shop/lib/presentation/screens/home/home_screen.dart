import 'package:flutter/material.dart';
import '../../common/constants.dart';
import 'components/body.dart';

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
      body: HomeScreenBody()
    );
  }
}
