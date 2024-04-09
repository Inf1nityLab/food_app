
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:food_app/model/food_model.dart';

class FoodService{

  Future<List<Food>> getData() async{
    final response = await http.get(Uri.parse('https://65f97f2bdf1514524611cbd0.mockapi.io/api/to_do/food'));


    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Food.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<void> putData(bool like,String id, ) async {
    final body =
    jsonEncode({"liked":like});
    final response = await http.put(
      Uri.parse(
          'https://65f97f2bdf1514524611cbd0.mockapi.io/api/to_do/food/$id'),
      body: body,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {

    } else {

    }
  }
}
