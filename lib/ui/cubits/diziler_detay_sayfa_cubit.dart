import 'package:filmleruygulamasi/data/entitiy/diziler_detay.dart';
import 'package:filmleruygulamasi/data/repo/proje_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DizilerDetaySayfaCubit extends Cubit<DizilerDetay?> {
  DizilerDetaySayfaCubit():super(null);

  var prepo = ProjeDaoRepository();

  Future<void> dizilerDetayGetir(int seriesId) async {
    var detay = await prepo.dizilerDetayGetir(seriesId);
    emit(detay);
  }
}