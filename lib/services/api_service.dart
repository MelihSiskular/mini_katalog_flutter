import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiService {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://wantapi.com/products.php"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List productsJson = data["data"];

      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception("Ürünler yüklenirken hata oluştu.");
    }
  }
}