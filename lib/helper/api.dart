import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:store2_app/services/add_product.dart';

class API {
  // Future<dynamic> getServices({required String URL}) async {
  //   http.Response respon = await http.get(Uri.parse(URL));

  //   if (respon.statusCode == 200) {
  //     return jsonDecode(respon.body);
  //   } else {
  //     throw Exception(
  //         'there is a problem with status code ${respon.statusCode} with body ${jsonDecode(respon.body)}');
  //   }
  // }
  Future<dynamic> getServices(
      {required String URL, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    print('url = $URL  token = $token ');
    http.Response response = await http.get(Uri.parse(URL), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('There is error ${response.statusCode}');
    }
  }
//////////////////////////////////////////////////////////////////////////////////////////
  Future<dynamic> postServices(
      {required String URL,
      @required dynamic bodyy,
      @required String? token}) async {
    Map<String, String> head = {};
    http.Response respon =
        await http.post(Uri.parse(URL), body: bodyy, headers: head);
    if (token != null) {
      head.addAll({'Authorization': 'Bearer $token'});
    }

    if (respon.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(respon.body);
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${respon.statusCode} with body ${jsonDecode(respon.body)}');
    }
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////
  Future<dynamic> putServices(
      {required String URL,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> head = {};
    http.Response respon =
        await http.put(Uri.parse(URL), body: body, headers: head);
    head.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      head.addAll({'Authorization': 'Bearer $token'});
    }

    if (respon.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(respon.body);
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${respon.statusCode} with body ${jsonDecode(respon.body)}');
    }
  }
}
