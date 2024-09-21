import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  dynamic get({required String url,@required String? token}) async {
     Map<String, String> headers = {};
     headers.addAll({'Accept': 'application/json'});
     headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});

     if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url),headers: headers);
    
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'There is problem with status Code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Accept': 'application/json'});
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(Uri.parse(url), body: body);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'There is problem with status Code ${response.statusCode}');
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token,
      }) async {
    Map<String, String> headers = {};
    headers.addAll({'Accept': 'application/json'});
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(Uri.parse(url), body: body);

    if (response.statusCode == 200) { 
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'There is problem with status Code ${response.statusCode}');
    }
  }
}
