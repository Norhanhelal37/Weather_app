import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathery/cubits/weather_cubit.dart';
import 'package:weathery/cubits/weather_state.dart';


class Exploar extends StatelessWidget {
  const Exploar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        WeatherCubit.get(context).getexplor();
        if (state is LoadingState || state is InitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SucessState) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: WeatherCubit.get(context).explor.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(right: 10, left: 10),
                margin: const EdgeInsets.only(bottom: 10),
                height: 80,
                width: 370,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(255, 179, 212, 236)
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          WeatherCubit.get(context).explor[index],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${WeatherCubit.get(context).myexplor[index]!.maxtemp} \u00B0C- ${WeatherCubit.get(context).myexplor[index]!.mintemp} \u00B0C",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      "${WeatherCubit.get(context).myexplor[index]!.avgtemp} ْ",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return  const Center(
            child: Text(
            
            "something wrong",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black),
                        )
          );
        }
      },
    );
  }
}
