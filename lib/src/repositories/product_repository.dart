import 'package:tkgapp/src/models/product.dart';
import 'package:tkgapp/src/models/product_detail.dart';
import 'package:tkgapp/src/services/product_service.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts(String keyword) async {
    final service = ProductService();
    final products = await service.fetchProducts(keyword);
    return products;
  }

  Future<ProductDetail> fetchProductDetail(String code) async {
    final service = ProductService();
    final product = await service.fetchProductDetail(code);
    return product;
  }
}
