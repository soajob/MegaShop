import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'item_card.dart';
import '../../../../domain/entities/product_entity.dart';
import '../../../bloc/product_list_cubit/product_list_cubit.dart';
import '../../../bloc/product_list_cubit/product_list_state.dart';
import '../../../common/constants.dart';
import '../../../common/loading_indicator.dart';
import '../../details/details_screen.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListCubit, ProductState>(
        builder: (context, state) {
          List<ProductEntity> products = [];
          bool isLoading = false;

          if (state is ProductLoading) {
            return const LoadingIndicator();
          } else if (state is ProductLoaded) {
            products = state.products;
          } else if (state is ProductError) {
            return Text(
              state.message,
              style: const TextStyle(color: Colors.white, fontSize: 25),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: _buildGridView(context, products)
              ),
            ],
          );
        }
    );
  }
}

Widget _buildGridView(BuildContext context, List<ProductEntity> products) {
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
        press: () => _handleProductClick(
            context,
            products[index]
        ),
      ),
    ),
  );
}

void _handleProductClick(BuildContext context, ProductEntity selectedProduct) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(
            product: selectedProduct,
          )
      )
  );
}
