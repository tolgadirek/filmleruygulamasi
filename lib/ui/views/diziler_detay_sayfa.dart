import 'package:filmleruygulamasi/data/entitiy/diziler.dart';
import 'package:filmleruygulamasi/data/entitiy/diziler_detay.dart';
import 'package:filmleruygulamasi/ui/cubits/diziler_detay_sayfa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DizilerDetaySayfa extends StatefulWidget {
  Diziler dizi;

  DizilerDetaySayfa({required this.dizi});

  @override
  State<DizilerDetaySayfa> createState() => _DizilerDetaySayfaState();
}

class _DizilerDetaySayfaState extends State<DizilerDetaySayfa> {

  @override
  void initState() {
    super.initState();
    context.read<DizilerDetaySayfaCubit>().dizilerDetayGetir(widget.dizi.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detay Sayfa"),),
      body: BlocBuilder<DizilerDetaySayfaCubit, DizilerDetay?>(
          builder: (context, diziDetay) {
            if(diziDetay == null){
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Image.network('https://image.tmdb.org/t/p/w500${diziDetay.backdropPath}'),
                      SizedBox(height: 20),
                      Text(
                        diziDetay.name,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText("Homepage: ${diziDetay.homepage}", style: TextStyle(fontSize: 16),),
                          Text("Status: ${diziDetay.status}", style: TextStyle(fontSize: 16)),
                          Row(
                            children: [
                              Text("Genres:", style: TextStyle(fontSize: 16),),
                              Row(
                                children: diziDetay.genres.map((genre) => Text(" ${genre.name}", style: TextStyle(fontSize: 18),)).toList(),
                              ),
                            ],
                          ),
                          Text("Origin Country: ${diziDetay.originCountry.join(', ')}", style: TextStyle(fontSize: 16),),
                          Text("Original Language: ${diziDetay.originalLanguage}", style: TextStyle(fontSize: 16)),
                          Text("Languages: ${diziDetay.languages.join(', ')}", style: TextStyle(fontSize: 16)),
                          Text("Spoken Languages: ${diziDetay.spokenLanguages.join(', ')}", style: TextStyle(fontSize: 16)),
                          Text("First Air Date: ${diziDetay.firstAirDate}", style: TextStyle(fontSize: 16)),
                          Text("Last Air Date: ${diziDetay.lastAirDate}", style: TextStyle(fontSize: 16)),
                          Text("Number of Seasons: ${diziDetay.numberOfSeasons}", style: TextStyle(fontSize: 16)),
                          Text("Number of Episodes: ${diziDetay.numberOfEpisodes}", style: TextStyle(fontSize: 16)),
                          Text("Popularity: ${diziDetay.popularity}", style: TextStyle(fontSize: 16)),
                          Text("Vote Average: ${diziDetay.voteAverage}", style: TextStyle(fontSize: 16)),
                          Text("Vote Count: ${diziDetay.voteCount}", style: TextStyle(fontSize: 16)),
                          Text("Budget: Bilgi Yok", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(diziDetay.overview, style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              );
            }
          }
      ),
    );
  }
}
