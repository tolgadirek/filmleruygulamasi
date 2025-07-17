import 'package:filmleruygulamasi/data/entitiy/filmler.dart';
import 'package:filmleruygulamasi/data/repo/proje_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmlerSayfaCubit extends Cubit<List<Filmler>>{
  FilmlerSayfaCubit():super(<Filmler>[]);

  var prepo = ProjeDaoRepository();

  Future<void> filmleriGetir() async{
    var liste = await prepo.filmleriGetir();
    emit(liste);
  }


  Future<void> filmAra(String arananKelime) async {
    var liste = await prepo.filmAra(arananKelime);
    emit(liste);
  }
}
