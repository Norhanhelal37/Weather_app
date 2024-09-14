import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathery/Networking/api_services.dart';
import 'package:weathery/cubits/weather_cubit.dart';
import 'package:weathery/screens/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => WeatherCubit(ApiServices.api),
      child:const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Start(),
        
      ),
    );
  }
}
