import 'package:mega_shop/domain/entities/product_entity.dart';
import 'package:mega_shop/domain/repositories/product_repository.dart';

import '../../core/usecases/usecase.dart';

class GetAllProducts extends UseCase<List<ProductEntity>, GetAllProductsParams> {
  final ProductRepository productRepository;

  GetAllProducts(this.productRepository);

  @override
  Future<List<ProductEntity>> call(GetAllProductsParams params) async {
    return await productRepository.getAllProducts();
  }
}

class GetAllProductsParams { }
