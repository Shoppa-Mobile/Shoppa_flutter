// ignore_for_file: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shoppa_app/enums.dart';

class AuthApi {
  final String baseUrl = "https://shoppa.sendrave.com/api";

  getUser(String endpoint) async {
    String url = baseUrl + endpoint;
    Response response = await http.get(
      Uri.parse(url),
      headers: setHeaders(),
    );
    Map userBody = json.decode(response.body);
    if (response.statusCode == 200) {
      String? userId = userBody['id'];
      String? displayName =
          "${userBody['first_name']} ${userBody['last_name']}";
      String? email = userBody['email'];
      return [
        userId,
        displayName,
        email,
      ];
    } else {}
  }

  registerUser(Map payload, String endpoint) async {
    String url = baseUrl + endpoint;
    Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(payload),
      headers: setHeaders(),
    );
    Map body = json.decode(response.body);
    if (response.statusCode == 201) {
      // ignore: use_build_context_synchronously
      // Navigator.of(context).pushNamed(
      //   ProofOfIdentityScreen.routeName,
      // );
      debugPrint(
        body['message'],
      );
      return AuthResult.success;
    }
    if (response.statusCode == 422) {
      debugPrint(
        'User already exist \n ${body['message']}',
      );
      return AuthResult.failure;
    }
  }

  checkEmail(String email, String endpoint) async {
    String url = baseUrl + endpoint;
    Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
      }),
      headers: setHeaders(),
    );
    var body = json.decode(response.body);
    if (response.statusCode == 200) {
      debugPrint(
        body['message'],
      );
      return EmailScope.notfound;
    }
    if (response.statusCode == 404) {
      debugPrint(
        body['message'],
      );
      return EmailScope.found;
    }
    if (response.statusCode == 503) {
      debugPrint(
        'Unable to check if email exists, try again',
      );
    }
  }

  loginUser(Map payload, String endpoint) async {
    String url = baseUrl + endpoint;
    Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(payload),
      headers: setHeaders(),
    );
    Map body = json.decode(response.body);
    if (response.statusCode == 200) {
      var token = body['access_token'];
      debugPrint(token);
      // await Future.delayed(const Duration(seconds: 2), () {
      //   Navigator.of(context).pushNamed(
      //     HomeScreen.routeName,
      //   );
      // });
      return AuthResult.success;
    }
    if (response.statusCode == 401) {
      debugPrint(
        'User ${body['error']}, Invalid Login Credentials',
      );
      return AuthResult.failure;
    }
  }

  setHeaders() => {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
}
