import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tkgapp/src/view_models/provider.dart';
import 'package:tkgapp/src/views/components/product_detail_contents.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(productDetailProvider(code));

    return Scaffold(
      appBar: AppBar(
        title: const Text('商品詳細'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: asyncValue.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text(error.toString())),
          data: (detail) => ProductDetailContents(detail: detail),
        ),
      ),
    );
  }
}
