import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../cart/cart_screen.dart';
import 'components/body.dart';
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
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            onPressed: () => _handleCartClick(context),
          ),
        ],
      ),
      body: const HomeScreenBody()
    );
  }
}

void _handleCartClick(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const CartScreen())
  );
}
