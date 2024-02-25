import '../../../domain/entities/product_entity.dart';

abstract class ProductState {
  const ProductState();
}

class ProductEmpty extends ProductState {}
class ProductLoading extends ProductState {}
class ProductLoaded extends ProductState {
  final List<ProductEntity> products;

  ProductLoaded(this.products);
}
class ProductError extends ProductState {
  final String message;

  ProductError({required this.message});
}
