// import 'dart:convert';
// import 'package:flutter/material.dart';
// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer' as devtools show log;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

// import 'package:shared_preferences/shared_preferences.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

class ProductsAPI {
  const ProductsAPI();
  final String baseUrl = "https://shoppa.sendrave.com/api";

  createNewProduct(
    Map productPayload,
    String authKey,
  ) async {
    String url = "$baseUrl/product/create";
    Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(productPayload),
      headers: setHeaders(
        authKey,
        'multipart/form-data',
      ),
    );
    if (response.statusCode == 201) {
      response.body.log();
    } else {
      response.body.log();
    }
    return response.statusCode;
  }

  viewProducts(
    int productID,
    String endpoint,
    String authKey,
  ) async {
    String url = "$baseUrl/product/$productID";
    Response response = await http.get(
      Uri.parse("$url/$productID"),
      headers: setHeaders(
        authKey,
        'application/json',
      ),
    );
    if (response.statusCode == 200) {
      response.body.log();
    } else {
      response.body.log();
    }
    return response.statusCode;
  }

  updateProduct(
    int productID,
    Map updatePayload,
    String endpoint,
    String authKey,
  ) async {
    String url = "$baseUrl/product/$productID";
    Response response = await http.post(
      Uri.parse("$url/$productID"),
      body: jsonEncode(updatePayload),
      headers: setHeaders(
        authKey,
        "multipart/form-data",
      ),
    );

    if (response.statusCode == 200) {
      response.body.log();
    } else {
      response.body.log();
    }
    return response.statusCode;
  }

  deleteProduct(
    int productID,
    String endpoint,
    String authKey,
  ) async {
    String url = "$baseUrl/product/$productID";
    Response response = await http.delete(
      Uri.parse("$url/$productID"),
      headers: setHeaders(
        authKey,
        'application/json',
      ),
    );
    if (response.statusCode == 200) {
      response.body.log();
    } else {
      response.body.log();
    }
    return response.statusCode;
  }

  setHeaders(String authKey, String content) => {
        "Authorization": "Bearer $authKey",
        "Accept": "application/json",
        "Content-Type": content,
      };
}
