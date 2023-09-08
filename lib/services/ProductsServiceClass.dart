// ignore_for_file: file_names, depend_on_referenced_packages, avoid_print
import 'dart:async';
import 'dart:convert';
import 'dart:developer' as devtools show log;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart' show MediaType;
import 'package:shoppa_app/models/productsModel.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

class ProductsAPI {
  const ProductsAPI();
  final String baseUrl = "https://shoppa.sendrave.com/api";

  createNewProduct({
    required String productName,
    required String productDescription,
    required double price,
    List<String>? colors,
    required String authKey,
    List<File>? images,
  }) async {
    try {
      String url = "$baseUrl/product/create";
      print('URL: $url');
      var uri = Uri.parse(url);
      var formData = http.MultipartRequest(
        'POST',
        uri,
      );
      // Add data from the form
      formData.fields['name'] = productName;
      formData.fields['description'] = productDescription;
      formData.fields['price'] = price.toString();
      formData.fields['in_stock'] = '100';
      if (colors != []) {
        for (int i = 0; i < colors!.length; i++) {
          var color = colors[i];
          formData.fields['colours[$i][hex]'] = color;
        }
      }
      // Add product image file
      if (images != []) {
        for (int i = 0; i < images!.length; i++) {
          var image = images[i];
          formData.files.add(
            http.MultipartFile(
              'images[$i]', // Form field name for the file
              image.readAsBytes().asStream(),
              image.lengthSync(),
              filename: image.path
                  .split('/')
                  .last, // Use the file name as the filename
              contentType:
                  MediaType('application', 'octet-stream'), // Set content type
            ),
          );
        }
      }
      // Set Headers
      formData.headers['Authorization'] = 'Bearer $authKey';
      formData.headers['Content-Type'] = 'multipart/form-data';
      formData.headers['Accept'] = 'application/json';

      var response = await formData.send().timeout(const Duration(seconds: 30));
      var responseBody = await response.stream.bytesToString();

      if (response.statusCode == 302) {
        // Handle redirection
        final location = response.headers['location'];
        if (location != null) {
          print('Redirection URL: $location');
          try {
            var newRequest = http.MultipartRequest(
                'POST', Uri.parse("$location/product/create"));
            // Add data from the form
            newRequest.fields['name'] = productName;
            newRequest.fields['description'] = productDescription;
            newRequest.fields['price'] = price.toString();
            newRequest.fields['in_stock'] = '100';
            if (colors != []) {
              newRequest.fields['colours'] = jsonEncode(colors);
            }
            // Add product image file
            if (images != []) {
              for (var file in images!) {
                newRequest.files.add(
                  http.MultipartFile(
                    'images[]', // Form field name for the file
                    file.readAsBytes().asStream(),
                    file.lengthSync(),
                    filename: file.path
                        .split('/')
                        .last, // Use the file name as the filename
                    contentType: MediaType(
                        'application', 'octet-stream'), // Set content type
                  ),
                );
              }
            }
            // Set Headers
            newRequest.headers['Authorization'] = 'Bearer $authKey';
            newRequest.headers['Content-Type'] = 'multipart/form-data';
            newRequest.headers['Accept'] = 'application/json';

            var newResponse =
                await newRequest.send().timeout(const Duration(seconds: 30));
            var newresponseBody = await newResponse.stream.bytesToString();
            if (newResponse.statusCode == 201) {
              // Request successful
              debugPrint(newresponseBody);
              newResponse.statusCode.log();
            } else {
              // Request failed
              print(
                  'Request failed with status ${response.statusCode}: $newresponseBody');
            }
            return response.statusCode;
          } catch (e) {
            // Handle errors that might occur during the new request
            print('Error during redirection: $e');
          }
        } else {
          // Handle case where redirection URL is missing
          print('Redirection URL: NOT AVAILABLE');
        }
      } else if (response.statusCode == 201) {
        // Request successful
        debugPrint(responseBody);
        response.statusCode.log();
      } else {
        // Request failed
        print(
            'Request failed with status ${response.statusCode}: $responseBody');
      }
      return response.statusCode;
    } catch (e) {
      if (e is TimeoutException) {
        // Handle the timeout error
        print('Connection timed out');
        return e;
        // Provide feedback to the user or retry the request
      } else {
        // Handle other types of errors
        ('Error: $e').log();
      }
    }
  }

  viewProduct(
    int productID,
    String endpoint,
    String authKey,
  ) async {
    try {
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
    } catch (e) {
      // Handle other types of errors
      ('Error: $e').log();
    }
  }

  updateProduct(
    int productID,
    Map updatePayload,
    String endpoint,
    String authKey,
  ) async {
    try {
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
    } catch (e) {
      // Handle other types of errors
      ('Error: $e').log();
    }
  }

  deleteProduct(
    int productID,
    String authKey,
  ) async {
    try {
      String url = "$baseUrl/product/$productID";
      Response response = await http.delete(
        Uri.parse(url),
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
    } catch (e) {
      // Handle other types of errors
      ('Error: $e').log();
    }
  }

  FutureOr<List<ProductsModel>> getProducts(
    String authKey,
  ) async {
    try {
      String url = "$baseUrl/product/";
      Response response = await http.get(
        Uri.parse(url),
        headers: setHeaders(
          authKey,
          'application/json',
        ),
      );
      if (response.statusCode == 200) {
        response.body.log();
        final jsonData = json.decode(response.body);
        final List<dynamic> products = (jsonData['data'] as List<dynamic>);
        return (products)
            .map(
              (item) => ProductsModel(
                productID: item['id'],
                productName: item['name'],
                productDescription: item['description'],
                productPrice: double.parse(item['price']),
                images: item['images'],
                colors: item['colours'],
              ),
            )
            .toList();
      } else {
        response.body.log();
      }
      return [];
    } catch (e) {
      // Handle other types of errors
      ('Error: $e').log();
      return [];
    }
  }

  setHeaders(String authKey, String content) => {
        "Authorization": "Bearer $authKey",
        "Accept": "application/json",
        "Content-Type": content,
      };
}
