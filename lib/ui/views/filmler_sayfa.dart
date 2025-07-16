import 'package:filmleruygulamasi/data/entitiy/filmler.dart';
import 'package:filmleruygulamasi/ui/cubits/filmler_sayfa_cubit.dart';
import 'package:filmleruygulamasi/ui/views/filmler_detay_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmlerSayfa extends StatefulWidget {
  const FilmlerSayfa({super.key});

  @override
  State<FilmlerSayfa> createState() => _FilmlerSayfaState();
}

class _FilmlerSayfaState extends State<FilmlerSayfa> {

  @override
  void initState() {
    super.initState();
    context.read<FilmlerSayfaCubit>().filmleriGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FilmlerSayfaCubit, List<Filmler>>(
          builder: (context, filmlerListesi) {
            if(filmlerListesi.isNotEmpty){
              return ListView.builder(
                  itemCount: filmlerListesi.length,
                  itemBuilder: (context, index) {
                    var film = filmlerListesi[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const FilmlerDetaySayfa()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Image.network('https://image.tmdb.org/t/p/w300${film.posterPath}',),
                                SizedBox(height: 20,),
                                Text(film.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Original Language : ${film.originalLanguage}", style: TextStyle(fontSize: 16),),
                                        Text("Release date : ${film.release_date}", style: TextStyle(fontSize: 16),),
                                        Text("Popularity : ${film.popularity}", style: TextStyle(fontSize: 16),),
                                        Text("Vote Average : ${film.voteAverage}", style: TextStyle(fontSize: 16),),
                                        Text("Vote Count : ${film.vote_count}", style: TextStyle(fontSize: 16),),


                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Text(film.overview, style: TextStyle(fontSize: 18),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
    );
  }
}
