// ignore_for_file: file_names, unrelated_type_equality_checks
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:developer' as devtools show log;

import 'package:shared_preferences/shared_preferences.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

class AuthApi {
  const AuthApi();
  final String baseUrl = "https://shoppa.sendrave.com/api";

  getUser(String endpoint) async {
    String url = baseUrl + endpoint;
    try {
      Response response = await http.get(
        Uri.parse(url),
        headers: setHeaders(),
      );
      Map userBody = json.decode(response.body);
      if (response.statusCode == 200) {
        String userId = userBody['id'];
        debugPrint(userId);
        return userId;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(
        e.toString(),
      );
      return null;
    }
  }

  String? get user => getUser('/user')?.toString();
  bool get isLoggedIn => user != null;

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
    return body['message'];
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
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var token = localStorage.setString('token', body['access_token']);
      localStorage.setString('user', json.encode(body['user']));      token.log();
      return response.statusCode;
    }
    if (response.statusCode == 422) {
      String error = 'User ${body['error']}, Invalid Login Credentials';
      error.log();
      return response.statusCode;
    } else {
      return null;
    }
  }

  registerUser(Map payload, String endpoint) async {
    String url = baseUrl + endpoint;
    Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(payload),
      headers: setHeaders(),
    );

    if (response.statusCode == 201) {
      response.body.log();
    } else {
      response.body.log();
    }
    return response.statusCode;
  }

  logoutUser(String token, String endpoint) async {}

  setHeaders() => {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
}
