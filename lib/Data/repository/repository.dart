// import 'dart:convert';

// import 'carousel.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// //const baseUrl = 'https://randomuser.me/api/0.4/?randomapi';
// const baseUrl = 'https://randomuser.me/api';
// final nextUrl = (next) => '$baseUrl/$next/?randomapi';

// class CarouselRepository {
//   final http.Client httpClient;
//   CarouselRepository({@required this.httpClient}) : assert(httpClient != null);

//   Future<Carousel> getUserData(String next) async {
//     final response =
//         await this.httpClient.get(baseUrl + '/' + next + '/?randomapi');
//     if (response.statusCode == 200) {
//       final user = jsonDecode(response.body);
//       return Carousel.fromJson(user);
//     } else {
//       throw Exception('Error');
//     }
//   }
// }
