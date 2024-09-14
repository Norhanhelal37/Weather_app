import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathery/cubits/weather_cubit.dart';
import 'package:weathery/cubits/weather_state.dart';
import 'package:weathery/screens/details_screen.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return TextFormField(
          onFieldSubmitted: (value) async {
            if(value.isNotEmpty){
             WeatherCubit.get(context).cityName = value;

             await WeatherCubit.get(context).getcityweather();
            }
           
          },
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              prefixIcon: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          BlocBuilder<WeatherCubit, WeatherState>(
                              builder: (context, state) =>const DetailsScreen()),
                    ));
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 26,
                  )),
              hintText: "Enter Location",
              hintStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              filled: true,
              fillColor: Colors.white.withOpacity(.13),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none)),
        );
      },
    );
  }
}
