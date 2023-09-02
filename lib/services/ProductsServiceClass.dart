// ignore_for_file: file_names, depend_on_referenced_packages, avoid_print
import 'dart:async';
import 'dart:convert';
import 'dart:developer' as devtools show log;
import 'dart:io';
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
    List? colors,
    required String authKey,
    File? file,
  }) async {
    try {
      String url = "$baseUrl/product/create";
      var uri = Uri.parse(url);
      var formData = http.MultipartRequest(
        'POST',
        uri,
      );
      // Add data from the form
      formData.fields['name'] = productName;
      formData.fields['description'] = productDescription;
      formData.fields['price'] = price.toString();
      if (colors != []) {
        formData.fields['colours'] = jsonEncode(colors);
      }
      // Add product image file
      if (file != null) {
        formData.files.add(
          await http.MultipartFile.fromPath(
            'fileField',
            file.path,
            contentType: MediaType('application', 'octet-stream'),
          ),
        );
      }
      // Set Headers
      formData.headers['Authorization'] = 'Bearer $authKey';
      formData.headers['Content-Type'] = 'multipart/form-data';

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
            if (colors != []) {
              newRequest.fields['colours'] = jsonEncode(colors);
            }
            // Add product image file
            if (file != null) {
              newRequest.files.add(
                await http.MultipartFile.fromPath(
                  'fileField',
                  file.path,
                  contentType: MediaType('application', 'octet-stream'),
                ),
              );
            }
            // Set Headers
            newRequest.headers['Authorization'] = 'Bearer $authKey';
            newRequest.headers['Content-Type'] = 'multipart/form-data';

            var newResponse =
                await newRequest.send().timeout(const Duration(seconds: 30));
            var newresponseBody = await newResponse.stream.bytesToString();
            if (newResponse.statusCode == 201) {
              // Request successful
              response.statusCode.log();
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
                goodsImage: (item['images'] as List<dynamic>)
                    .cast<Map<String, dynamic>>(),
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
