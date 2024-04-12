import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tkgapp/src/repositories/product_repository.dart';

final obscureProvider = StateProvider((_) => true);

final currentIndexProvider = StateProvider((_) => 0);

final textProvider = StateProvider((_) => '');

final controllerProvider = StateProvider.autoDispose((ref) {
  final text = ref.watch(textProvider);
  return TextEditingController(text: text);
});

final repositoryProvider = Provider((_) => ProductRepository());

final productsProvider = FutureProvider.autoDispose((ref) async {
  final keyword = ref.watch(textProvider);
  final repository = ref.read(repositoryProvider);
  final products = await repository.fetchProducts(keyword);
  return products;
});

final productDetailProvider =
    FutureProvider.autoDispose.family((ref, code) async {
  final repository = ref.read(repositoryProvider);
  final detail = await repository.fetchProductDetail(code.toString());
  return detail;
});
