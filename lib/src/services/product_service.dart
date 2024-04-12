import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tkgapp/src/models/product.dart';
import 'package:tkgapp/src/models/product_detail.dart';

class ProductService {
  Future<List<Product>> fetchProducts(String keyword) async {
    if (keyword.isEmpty) {
      return [];
    }

    try {
      final db = FirebaseFirestore.instance;
      final snapshots = await db
          .collection('products')
          .orderBy('shohin_kataban')
          .startAt([keyword]).endAt(['$keyword\uf8ff']).get();

      final products =
          snapshots.docs.map((doc) => Product.fromFirestore(doc)).toList();

      return products;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<ProductDetail> fetchProductDetail(String code) async {
    final dio = Dio();

    final host = Platform.isAndroid ? 'http://10.0.2.2' : 'http://localhost';

    final url = '$host:3000/tkgapp/v1/products/$code';

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final detail = ProductDetail.fromJson(response.data);
      return detail;
    } else {
      throw Exception('Failed Http Request');
    }
  }
}
