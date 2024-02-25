import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_shop/presentation/bloc/product_list_cubit/product_list_cubit.dart';

import '../../../domain/entities/product_entity.dart';
import '../../bloc/product_list_cubit/product_list_state.dart';
import '../../common/constants.dart';
import 'item_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
        body: _buildBody()
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: textColorDarkCommon,
    title: const Text(appName, style: TextStyle(color: Colors.white)),
    centerTitle: true,
  );
}

Widget _buildBody() {
  return BlocBuilder<ProductListCubit, ProductState>(
      builder: (context, state) {
        List<ProductEntity> products = [];
        bool isLoading = false;

        if (state is ProductLoading) {
          return _loadingIndicator();
        } else if (state is ProductLoaded) {
          products = state.products;
        } else if (state is ProductError) {
          return Text(
            state.message,
            style: TextStyle(color: Colors.white, fontSize: 25),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: _buildGridView(products)
            ),
          ],
        );
      }
  );
}

Widget _buildGridView(List<ProductEntity> products) {
  return Padding(
    padding: const EdgeInsets.symmetric(
        horizontal: defaultPaddingCommon,
        vertical: defaultPaddingCommon
    ),
    child: GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: defaultPaddingCommon,
        crossAxisSpacing: defaultPaddingCommon,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) => ItemCard(
        product: products[index],
        press: () { },
      ),
    ),
  );
}

Widget _loadingIndicator() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
