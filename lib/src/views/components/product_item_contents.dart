import 'package:flutter/material.dart';

class ProductItemContents extends StatelessWidget {
  const ProductItemContents({
    super.key,
    required this.lblTitle,
    required this.lblData,
  });

  final String lblTitle;
  final String lblData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 90, child: Text(lblTitle)),
        const SizedBox(width: 8),
        Text(lblData),
      ],
    );
  }
}
