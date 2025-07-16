import 'package:flutter/material.dart';

class DizilerDetaySayfa extends StatefulWidget {
  const DizilerDetaySayfa({super.key});

  @override
  State<DizilerDetaySayfa> createState() => _DizilerDetaySayfaState();
}

class _DizilerDetaySayfaState extends State<DizilerDetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detay Sayfa"),),
      body: Center(),
    );
  }
}
