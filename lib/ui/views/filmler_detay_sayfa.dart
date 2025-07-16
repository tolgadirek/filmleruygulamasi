import 'package:filmleruygulamasi/data/entitiy/filmler.dart';
import 'package:filmleruygulamasi/data/entitiy/filmler_detay.dart';
import 'package:filmleruygulamasi/ui/cubits/filmler_detay_sayfa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmlerDetaySayfa extends StatefulWidget {
  Filmler film;

  FilmlerDetaySayfa({required this.film});

  @override
  State<FilmlerDetaySayfa> createState() => _FilmlerDetaySayfaState();
}

class _FilmlerDetaySayfaState extends State<FilmlerDetaySayfa> {

  @override
  void initState() {
    super.initState();
    context.read<FilmlerDetaySayfaCubit>().filmlerDetayGetir(widget.film.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Films and Series", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocBuilder<FilmlerDetaySayfaCubit, FilmlerDetay?>(
          builder: (context, filmDetay) {
            if(filmDetay == null){
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Image.network('https://image.tmdb.org/t/p/w500${filmDetay.backdropPath}',),
                      SizedBox(height: 20,),
                      Text(filmDetay.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                      SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText("Homepage: ${filmDetay.homepage}", style: TextStyle(fontSize: 16),),
                          Text("Status: ${filmDetay.status}", style: TextStyle(fontSize: 16),),
                          Row(
                            children: [
                              Text("Genres:", style: TextStyle(fontSize: 16),),
                              Row(
                                children: filmDetay.genres.map((genre) => Text(" ${genre.name}", style: TextStyle(fontSize: 18),)).toList(),
                              ),
                            ],
                          ),
                          Text("Belongs to Collection: ${filmDetay.belongToCollection}", style: TextStyle(fontSize: 16),),
                          Text("Original Language: ${filmDetay.originalLanguage}", style: TextStyle(fontSize: 16),),
                          Text("Runtime: ${filmDetay.runtime} minutes", style: TextStyle(fontSize: 16),),
                          Text("Vote Average: ${filmDetay.voteAverage}", style: TextStyle(fontSize: 16),),
                          Text("Vote Count: ${filmDetay.voteCount}", style: TextStyle(fontSize: 16),),
                          Text("Budget: \$${filmDetay.budget}", style: TextStyle(fontSize: 16),),
                          Text("Popularity: ${filmDetay.popularity}", style: TextStyle(fontSize: 16),),
                          Text("Release Date: ${filmDetay.releaseDate}", style: TextStyle(fontSize: 16),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text(filmDetay.overview, style: TextStyle(fontSize: 18),),


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
