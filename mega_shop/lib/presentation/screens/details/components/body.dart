import 'package:flutter/material.dart';
import 'color_select_item.dart';
import '../../../../domain/entities/product_entity.dart';
import '../../../common/constants.dart';

class DetailsScreenBody extends StatelessWidget {
  final ProductEntity product;

  const DetailsScreenBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                _buildDescriptiveProductInfo(context, size, product),
                _buildMainProductInfo(context, product)
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildMainProductInfo(BuildContext context, ProductEntity product) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: defaultPaddingCommon),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: defaultPaddingCommon),
        Text(
          product.category,
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          product.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: defaultPaddingCommon),
        Row(
          children: <Widget>[
            _buildProductPrice(context, product),
            const SizedBox(width: defaultPaddingCommon),
            _buildProductImage(product)
          ]
        )
      ],
    ),
  );
}

Widget _buildProductPrice(BuildContext context, ProductEntity product) {
  return RichText(
    text: TextSpan(
      children: [
        const TextSpan(text: "Price\n"),
        TextSpan(
          text: "\$${product.price}",
          style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
        ),
      ]
    )
  );
}

Expanded _buildProductImage(ProductEntity product) {
  return Expanded(
    child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          image: AssetImage(product.image),
          alignment: Alignment.center,
          height: 250,
          width: 100,
          fit: BoxFit.fill,
        )
    ),
  );
}

Widget _buildDescriptiveProductInfo(
    BuildContext context, Size size, ProductEntity product
) {
  return Container(
    margin: EdgeInsets.only(top: size.height * 0.3),
    padding: EdgeInsets.only(
      top: size.height * 0.12,
      left: defaultPaddingCommon,
      right: defaultPaddingCommon,
    ),
    // height: 500,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            _buildColorProductInfo(),
            _buildProductSizeIfo(context, product),
          ],
        ),
        // ColorAndSize(product: product),
        const SizedBox(height: defaultPaddingCommon / 2),
        _buildDescription(product),
        const SizedBox(height: defaultPaddingCommon / 2),
        // SizedBox(height: defaultPaddingCommon / 2),
      ],
    ),
  );
}

Widget _buildColorProductInfo() {
  return const Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Color"),
        Row(
          children: <Widget>[
            ColorSelectItem(color: Color(0xFF356C95), isSelected: true,),
            ColorSelectItem(color: Color(0xFFF8C078), isSelected: true,),
            ColorSelectItem(color: Color(0xFFA29B9B), isSelected: false),
          ],
        ),
      ],
    ),
  );
}

Widget _buildProductSizeIfo(BuildContext context, ProductEntity product) {
  return  Expanded(
    child: RichText(
      text: TextSpan(
        style: const TextStyle(color: textColorDarkCommon),
        children: [
          const TextSpan(text: "Size\n"),
          TextSpan(
            text: "${product.size}",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}

Widget _buildDescription(ProductEntity product) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: defaultPaddingCommon),
    child: Text(
      product.description,
      style: const TextStyle(height: 1.5),
    ),
  );
}
