import 'package:dio/dio.dart';

const String accessToken = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MmY3MzQ0ODYwMzlhNTEyMGExYmM4MzhmYjE4ODhiMyIsIm5iZiI6MTc1MjY0OTk4OC4wNCwic3ViIjoiNjg3NzUxMDRiODdhMzZlYTIxY2NlMTBhIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.FgZRLgn9ysSc5OJE_Pbi9kdGt1BhQACLRgjebqHES6I';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    headers: {
      'Authorization': accessToken,
      'Content-Type': 'application/json;charset=utf-8',
    },
  ),
);