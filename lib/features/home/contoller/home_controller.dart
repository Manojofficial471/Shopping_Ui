import 'package:dummy_project/api/apiendpoints.dart';

import 'package:dummy_project/features/home/model/home_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeCategoryController {
  Future<List<HomeCategory>> fetchHomeCategories() async {
    final uri = Uri.parse(Endpoints.homeCategories);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        print("Response body: ${response.body}");

        final jsonResponse = json.decode(response.body);

        if (jsonResponse is! Map) {
          throw FormatException('Invalid JSON format');
        }

        print("Success: ${jsonResponse['success']}");

        final categoriesData = jsonResponse['categories']['data'] as List;

        return categoriesData
            .map((data) => HomeCategory.fromJson(data))
            .toList();
      } else {
        throw Exception(
            'Failed to load categories. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error occurred: $e");
      throw Exception('Failed to fetch home categories: $e');
    }
  }

  Future<List<Product>> fetchHomeProducts() async {
    final uri = Uri.parse(Endpoints.homeProduct);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        print("Response body: ${response.body}");

        final jsonResponse = json.decode(response.body);

        if (jsonResponse is! Map) {
          throw FormatException('Invalid JSON format');
        }

        print("Success: ${jsonResponse['success']}");

        final productsData = jsonResponse['data'] as List;

        return productsData.map((item) {
          final productDetail = item['productdetail'] as List;
          if (productDetail.isNotEmpty) {
            return Product.fromJson(productDetail[0]);
          } else {
            throw FormatException('Product details are missing');
          }
        }).toList();
      } else {
        throw Exception(
            'Failed to load products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error occurred: $e");
      throw Exception('Failed to fetch home products: $e');
    }
  }
}
