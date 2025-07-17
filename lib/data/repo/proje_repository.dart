import 'package:filmleruygulamasi/data/entitiy/diziler.dart';
import 'package:filmleruygulamasi/data/entitiy/diziler_detay.dart';
import 'package:filmleruygulamasi/data/entitiy/filmler.dart';
import 'package:filmleruygulamasi/data/entitiy/filmler_detay.dart';
import 'package:filmleruygulamasi/data/services/dio_service.dart';

class ProjeDaoRepository{
  Future<List<Filmler>> filmleriGetir() async {
    try {
      final response = await dio.get('/movie/popular', queryParameters: {
        'language': 'en-US',
        'page': 1,
      });

      final List results = response.data['results'];
      return results.map((json) => Filmler.fromJson(json)).toList();
    } catch (e) {
      print('Hata: $e');
      return [];
    }
  }

  Future<List<Diziler>> dizileriGetir() async {
    try {
      final response = await dio.get('/tv/popular', queryParameters: {
        'language': 'en-US',
        'page': 1,
      });

      final List results = response.data['results'];
      return results.map((json) => Diziler.fromJson(json)).toList();
    } catch (e) {
      print('Hata: $e');
      return [];
    }
  }

  Future<FilmlerDetay?> filmlerDetayGetir(int movieId) async {
    try {
      final response = await dio.get('/movie/$movieId', queryParameters: {
        'language': 'en-US',
        'append_to_response': 'videos,credits',
      });

      return FilmlerDetay.fromJson(response.data);
    } catch (e) {
      print('Hata: $e');
      return null;
    }
  }

  Future<DizilerDetay?> dizilerDetayGetir(int seriesId) async {
    try {
      final response = await dio.get('/tv/$seriesId', queryParameters: {
        'language': 'en-US',
        'append_to_response': 'videos,credits',
      });

      return DizilerDetay.fromJson(response.data);
    } catch (e) {
      print('Hata: $e');
      return null;
    }
  }
}