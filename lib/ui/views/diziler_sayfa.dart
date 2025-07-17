import 'package:filmleruygulamasi/data/entitiy/diziler.dart';
import 'package:filmleruygulamasi/ui/cubits/diziler_sayfa_cubit.dart';
import 'package:filmleruygulamasi/ui/views/diziler_detay_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DizilerSayfa extends StatefulWidget {
  const DizilerSayfa({super.key});

  @override
  State<DizilerSayfa> createState() => _DizilerSayfaState();
}

class _DizilerSayfaState extends State<DizilerSayfa> {
  var tfAra = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<DizilerSayfaCubit>().dizileriGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: tfAra,
            onChanged: (value) {
              context.read<DizilerSayfaCubit>().diziAra(value);
            },
            decoration: const InputDecoration(
              hintText: "Ara",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),),
          ),
          Expanded(
            child: BlocBuilder<DizilerSayfaCubit, List<Diziler>>(
                builder: (context, dizilerListesi) {
                  if(dizilerListesi.isNotEmpty){
                    return ListView.builder(
                      itemCount: dizilerListesi.length,
                      itemBuilder: (context, index) {
                        var dizi = dizilerListesi[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DizilerDetaySayfa(dizi: dizi,)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Image.network('https://image.tmdb.org/t/p/w200${dizi.posterPath}',),
                                    SizedBox(height: 20,),
                                    Text(dizi.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                                    SizedBox(height: 20,),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Origin Country: ${dizi.originCountry.join(", ")}"),
                                            Text("Original Language : ${dizi.originalLanguage}", style: TextStyle(fontSize: 16),),
                                            Text("Release date : ${dizi.firstAirDate}", style: TextStyle(fontSize: 16),),
                                            Text("Popularity : ${dizi.popularity}", style: TextStyle(fontSize: 16),),
                                            Text("Vote Average : ${dizi.voteAverage}", style: TextStyle(fontSize: 16),),
                                            Text("Vote Count : ${dizi.vote_count}", style: TextStyle(fontSize: 16),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
            ),
          ),
        ],
      ),
    );
  }
}
