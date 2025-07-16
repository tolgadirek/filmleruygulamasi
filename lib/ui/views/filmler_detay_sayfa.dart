import 'package:flutter/material.dart';

class FilmlerDetaySayfa extends StatefulWidget {
  const FilmlerDetaySayfa({super.key});

  @override
  State<FilmlerDetaySayfa> createState() => _FilmlerDetaySayfaState();
}

class _FilmlerDetaySayfaState extends State<FilmlerDetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detay sayfa"),),
      body: Center(),
    );
  }
}
