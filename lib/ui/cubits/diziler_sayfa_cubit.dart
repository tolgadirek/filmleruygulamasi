import 'package:filmleruygulamasi/data/entitiy/diziler.dart';
import 'package:filmleruygulamasi/data/repo/proje_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DizilerSayfaCubit extends Cubit<List<Diziler>> {
  DizilerSayfaCubit():super(<Diziler>[]);

  var prepo = ProjeDaoRepository();

  Future<void> dizileriGetir() async {
    var liste = await prepo.dizileriGetir();
    emit(liste);
  }


}