import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_shop/domain/usecases/get_all_products.dart';
import 'package:mega_shop/presentation/bloc/product_list_cubit/product_list_state.dart';

class ProductListCubit extends Cubit<ProductState> {
  final GetAllProducts getAllProducts;

  ProductListCubit({required this.getAllProducts}) : super(ProductEmpty());

  void loadProducts() async {
    if (state is ProductLoading) return;

    emit(ProductLoading());

    final products = await getAllProducts(GetAllProductsParams());
    emit(ProductLoaded(products));
  }
}
