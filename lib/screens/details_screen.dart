import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathery/cubits/weather_cubit.dart';
import 'package:weathery/cubits/weather_state.dart';

import 'package:weathery/screens/home_screen.dart';
import 'package:weathery/widgets/error.dart';
import 'package:weathery/widgets/forcast.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is LoadingState || state is InitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SucessState &&
              WeatherCubit.get(context).myweather != null) {
            WeatherCubit.get(context).getColor();

            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [WeatherCubit.get(context).color!, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          onPressed: () {
                            WeatherCubit.get(context).reset();
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ));
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 27,
                          )),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      WeatherCubit.get(context).cityName ?? "",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${WeatherCubit.get(context).myweather?.maxtemp} \u00B0C - ${WeatherCubit.get(context).myweather?.mintemp} \u00B0C ",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          WeatherCubit.get(context).myweather?.status ?? "",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const Forecast()
                  ],
                ),
              ),
            );
          } else {
            return const ErrorCase();
          }
        },
      ),
    );
  }
}
