import 'dart:convert';

//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/carousel.dart';

//const baseUrl = 'https://randomuser.me/api/0.4/?randomapi';
const baseUrl = 'https://randomuser.me/api';
final nextUrl = (next) => '$baseUrl/$next/?randomapi';

class CarouselRepository {
  Future<List<Carousel>> getUserData(String next) async {
    final response = await http.get(nextUrl(next));
    if (response.statusCode == 200) {
      final user = jsonDecode(response.body);
      return Carousel.fromJson(user) as List;
    } else {
      throw Exception('Error');
    }
  }
}

// final http.Client httpClient;
//   CarouselRepository({this.httpClient}) : assert(httpClient != null);

/*this.httpClient*/

/*baseUrl + '/' + next + '/?randomapi'*/
