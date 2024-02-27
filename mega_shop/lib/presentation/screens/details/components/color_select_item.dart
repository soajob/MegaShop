import 'package:flutter/material.dart';
import '../../../common/constants.dart';

class ColorSelectItem extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const ColorSelectItem({
    super.key,
    required this.color,
    required this.isSelected
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: defaultPaddingCommon / 4,
        right: defaultPaddingCommon / 2,
      ),
      padding: const EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
