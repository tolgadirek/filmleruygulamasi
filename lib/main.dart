import 'package:filmleruygulamasi/ui/cubits/diziler_sayfa_cubit.dart';
import 'package:filmleruygulamasi/ui/cubits/filmler_sayfa_cubit.dart';
import 'package:filmleruygulamasi/ui/views/sabit_yapilar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FilmlerSayfaCubit()),
        BlocProvider(create: (context) => DizilerSayfaCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const SabitYapilar(),
      ),
    );
  }
}
