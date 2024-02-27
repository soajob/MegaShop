import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_shop/presentation/bloc/product_list_cubit/product_list_cubit.dart';
import 'package:mega_shop/presentation/common/constants.dart';
import 'package:mega_shop/presentation/screens/home/home_screen.dart';
import 'package:mega_shop/locator_service.dart' as di;
import '../locator_service.dart';

void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductListCubit>(
            create: (context) => serviceLocator<ProductListCubit>()..loadProducts(),
          )
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: appName,
            theme: ThemeData(
              textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: textColorDarkCommon
              ),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: const HomeScreen()
        )
    );
  }
}
