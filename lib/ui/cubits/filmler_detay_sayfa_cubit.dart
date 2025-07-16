import 'package:filmleruygulamasi/data/entitiy/filmler_detay.dart';
import 'package:filmleruygulamasi/data/repo/proje_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmlerDetaySayfaCubit extends Cubit<FilmlerDetay?> {
  FilmlerDetaySayfaCubit():super(null);
  
  var prepo = ProjeDaoRepository();

  Future<void> filmlerDetayGetir(int movieId) async {
    final detay = await prepo.filmlerDetayGetir(movieId);
    emit(detay);

  }
}