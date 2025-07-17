import 'package:dio/dio.dart';

const String accessToken = 'Bearer API_KEY';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    headers: {
      'Authorization': accessToken,
      'Content-Type': 'application/json;charset=utf-8',
    },
  ),
);
