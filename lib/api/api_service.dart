// ignore_for_file: body_might_complete_normally_nullable

import 'dart:convert';

import 'package:app_order/config.dart';
import 'package:app_order/models/category.dart';
import 'package:app_order/models/product.dart';
import 'package:app_order/models/product_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final apiService = Provider((ref) => APIService());

class APIService {
  static var client = http.Client();

  Future<List<Category>?> getCategories(page, pageSize) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString(),
    };

    // Response res = await get(Uri.parse(postsURL));
    var url = Uri.http(Config.apiURL, Config.categoryAPI, queryString);
    // log('data: $url');

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return categoriesFromJson(data["data"]);
    }
  }

  Future<List<Product>?> getProducts(
      ProductFilterModel productFilterModel) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Map<String, String> queryString = {
      'page': productFilterModel.paginationModel.toString(),
      'pageSize': productFilterModel.paginationModel.toString(),
    };

    if (productFilterModel.CategoryId != null) {
      queryString["categoryId"] = productFilterModel.CategoryId!;
    }
    if (productFilterModel.sortBy != null) {
      queryString["sort"] = productFilterModel.sortBy!;
    }
    // Response res = await get(Uri.parse(postsURL));
    var url = Uri.http(Config.apiURL, Config.productAPI, queryString);
    // log('data: $url');

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return productsFromJson(data["data"]);
    }
  }
}
