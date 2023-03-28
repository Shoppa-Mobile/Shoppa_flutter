// ignore_for_file: file_names
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthApi {
  final String baseUrl = "https://shoppa.sendrave.com/api";

  registerUser(Map payload, String endpoint) async {
    String url = baseUrl + endpoint;
    return await http.post(
      Uri.parse(url),
      body: jsonEncode(payload),
      headers: setHeaders(),
    );
  }

  checkEmail(String email, String endpoint) async {
    String url = baseUrl + endpoint;
    return await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
      }),
      headers: setHeaders(),
    );
  }

  loginUser(Map payload, String endpoint) async {
    String url = baseUrl + endpoint;
    return await http.post(
      Uri.parse(url),
      body: jsonEncode(payload),
      headers: setHeaders(),
    );
  }

  setHeaders() => {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
}
