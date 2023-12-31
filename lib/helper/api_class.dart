import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'There is a problem with the status code ${response.statusCode}');
    }
  }

  post({required String Url, required Map<String, String> body}) {}
}

Future<dynamic> post(
    {required String url,
    @required String? token,
    @required dynamic body}) async {
  Map<String, String> headers = {};
  if (token != null) {
    headers.addAll({'Authorization': 'Bearer $token'});
  }

  http.Response response =
      await http.post(Uri.parse(url), body: body, headers: headers);
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception(
        'There is a problem with the status code ${response.statusCode} with body ${jsonDecode(response.body)}');
  }
}

Future<dynamic> put(
    {required String url,
    @required String? token,
    @required dynamic body}) async {
  Map<String, String> headers = {};
  headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
  if (token != null) {
    headers.addAll({'Authorization': 'Bearer $token'});
  }

  http.Response response =
      await http.post(Uri.parse(url), body: body, headers: headers);
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception(
        'There is a problem with the status code ${response.statusCode} with body ${jsonDecode(response.body)}');
  }
}
