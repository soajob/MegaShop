import 'package:mega_shop/domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';
import 'dart:math';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<ProductEntity>> getAllProducts() async {
    return await _getProducts();
  }

  Future<List<ProductEntity>> _getProducts() async {
    return Future.value(_getFakeProducts());
  }

  List<ProductEntity> _getFakeProducts() {
    List<ProductEntity> products = [];

    for (int i = 1; i < 7; i++) {
      products.add(_generateFakeProduct(i));
    }

    return products;
  }

  ProductEntity _generateFakeProduct(int index) => ProductEntity(
      id: index,
      title: "Product #$index: Title",
      price: 100 + index,
      size: Random().nextInt(20),
      description: "Product #$index: Description",
      image: _getImagePath(index-1),
      // "assets/images/men_image_1.png"
    );

  String _getImagePath(int index) {
    List<String> paths = [
      "assets/images/men_image_1.png",
      "assets/images/men_image_2.png",
      "assets/images/men_image_3.png",
      "assets/images/woman_image_1.png",
      "assets/images/woman_image_2.png",
      "assets/images/woman_image_3.png"
    ];

    return paths[index];
  }
}
