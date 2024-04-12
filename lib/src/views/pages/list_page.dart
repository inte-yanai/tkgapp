import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tkgapp/src/view_models/provider.dart';
import 'package:tkgapp/src/views/components/product_contents.dart';

class ListPage extends ConsumerWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(controllerProvider);
    final productsVal = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.clear,
                size: 24,
              ),
              onPressed: () => controller.clear(),
            ),
            hintText: '型番検索',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          controller: controller,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          onSubmitted: (text) => ref.read(textProvider.notifier).state = text,
        ),
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: productsVal.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Center(child: Text(err.toString())),
          data: (products) {
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (_, index) =>
                  ProductContents(product: products[index]),
            );
          },
        ),
      ),
    );
  }
}
