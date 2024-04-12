import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tkgapp/src/models/product.dart';
import 'package:tkgapp/src/router/router_path.dart';

class ProductContents extends StatelessWidget {
  const ProductContents({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(),
        title: Text(product.code),
        subtitle: Text(product.kataban),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 12,
        ),
        onTap: () => context.pushNamed(
          RouterPath.detail,
          pathParameters: {'code': product.code},
        ),
      ),
    );
  }
}
