import 'package:filmleruygulamasi/ui/views/diziler_sayfa.dart';
import 'package:filmleruygulamasi/ui/views/filmler_sayfa.dart';
import 'package:flutter/material.dart';

class SabitYapilar extends StatefulWidget {
  const SabitYapilar({super.key});

  @override
  State<SabitYapilar> createState() => _SabitYapilarState();
}

class _SabitYapilarState extends State<SabitYapilar> {
  int secilenIndex = 0;
  var sayfalar = [const FilmlerSayfa(), const DizilerSayfa()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Films and Series", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: sayfalar[secilenIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie_outlined), label: "Films",),
          BottomNavigationBarItem(icon: Icon(Icons.tv_outlined), label: "Tv Series",),
        ],
        currentIndex: secilenIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: true,
        showUnselectedLabels: true,

        onTap: (indeks){
          setState(() {
            secilenIndex = indeks;
          });
        },
      ),
    );
  }
}
