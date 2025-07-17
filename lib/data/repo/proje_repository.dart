import 'package:filmleruygulamasi/data/entitiy/diziler.dart';
import 'package:filmleruygulamasi/data/entitiy/diziler_detay.dart';
import 'package:filmleruygulamasi/data/entitiy/filmler.dart';
import 'package:filmleruygulamasi/data/entitiy/filmler_detay.dart';
import 'package:filmleruygulamasi/data/services/dio_service.dart';

class ProjeDaoRepository{
  Future<List<Filmler>> filmleriGetir() async {
    List<Filmler> tumFilmler = [];

    try {
      for (int i = 1; i <= 3; i++) {
        final response = await dio.get('/discover/movie', queryParameters: {
          'language': 'en-US',
          'page': i,
        });

        final List results = response.data['results'];
        final List<Filmler> sayfaFilmleri = results.map((json) => Filmler.fromJson(json)).toList();
        tumFilmler.addAll(sayfaFilmleri);
      }

      return tumFilmler;
    } catch (e) {
      print('Hata: $e');
      return [];
    }
  }

  Future<List<Diziler>> dizileriGetir() async {
    List<Diziler> tumDiziler = [];

    try {
      for (int i = 1; i <= 3; i++) {
        final response = await dio.get('/discover/tv', queryParameters: {
          'language': 'en-US',
          'page': i,
        });

        final List results = response.data['results'];
        final List<Diziler> sayfaDizileri = results.map((json) => Diziler.fromJson(json)).toList();
        tumDiziler.addAll(sayfaDizileri);
      }

      return tumDiziler;
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

  Future<List<Filmler>> filmAra(String arananKelime) async {
    try {
      final response = await dio.get('/search/movie', queryParameters: {
        'query': arananKelime,
        'language': 'en-Us',
        'page': 1,
      });

      final List results = response.data['results'];
      return results.map((json) => Filmler.fromJson(json)).toList();
    } catch (e) {
      print('Arama hatası: $e');
      return [];
    }
  }

  Future<List<Diziler>> diziAra(String arananKelime) async {
    try {
      final response = await dio.get('/search/tv', queryParameters: {
        'query': arananKelime,
        'language': 'en-Us',
        'page': 1,
      });

      final List results = response.data['results'];
      return results.map((json) => Diziler.fromJson(json)).toList();
    } catch (e) {
      print('Arama hatası: $e');
      return [];
    }
  }

}