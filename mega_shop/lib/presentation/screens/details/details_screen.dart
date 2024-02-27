import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_shop/presentation/common/constants.dart';
import 'components/body.dart';
import '../../../domain/entities/product_entity.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailsScreen({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textColorLightCommon,
      appBar: AppBar(
        backgroundColor: textColorDarkCommon,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: DetailsScreenBody(product: product),
    );
  }
}
