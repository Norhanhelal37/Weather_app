import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathery/cubits/weather_cubit.dart';
import 'package:weathery/cubits/weather_state.dart';

class Forecast extends StatelessWidget {
  const Forecast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 100),
            height: 90,
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.4),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                const Text(
                  "forecast",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 70,
                            child: Row(
                              children: [
                                Image.asset(
                                  WeatherCubit.get(context).myweather!.getImage(WeatherCubit.get(context)
                                          .myweather
                                          ?.forcast[index + 1]["day"]
                                      ["condition"]["text"],),
                                  height: 20,
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  WeatherCubit.get(context)
                                      .myweather
                                      ?.forcast[index + 1]["date"],
                                  style:const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Text(
                            '${WeatherCubit.get(context).myweather?.forcast[index + 1]["day"]["mintemp_c"]} \u00B0C - ${WeatherCubit.get(context).myweather?.forcast[index + 1]["day"]["maxtemp_c"]} \u00B0C',
                            style:const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          )
                        ]);
                  },
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
