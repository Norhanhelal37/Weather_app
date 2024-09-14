import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathery/Networking/api_services.dart';
import 'package:weathery/cubits/weather_state.dart';
import 'package:weathery/models/weather_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final ApiServices api;
  WeatherCubit(this.api) : super(InitialState());

  static WeatherCubit get(context) => BlocProvider.of(context);

  String? cityName;
  WeatherModel? myweather;

  MaterialColor? color;

  List<String> explor = ['Cairo', 'Alexandria', "Tokyo"];

  List<WeatherModel?> myexplor = [];

  Future<void> getcityweather() async {
    emit(LoadingState());
    try {
      myweather = await api.fetchData(cityName!);
      emit(SucessState());
    } catch (e) {
      emit(FailureState());
      throw (e.toString());
    }
  }

  void reset() {
    cityName = "";
    myweather = null;
    emit(InitialState());
  }

  getexplor() async {
    for (int i = 0; i < explor.length; i++) {
      myexplor.add(await api.fetchData(explor[i]));
    }
    emit(SucessState());
  }

  void getColor() {
    if (myweather!.status == 'Sunny') {
      color = Colors.orange;
      emit(SucessState());
    } else if (myweather!.status == 'Blizzard' ||
        myweather!.status == 'Clear' ||
        myweather!.status == 'Partly cloudy' ||
        myweather!.status == 'Patchy snow possible' ||
        myweather!.status == 'Patchy sleet possible' ||
        myweather!.status == 'Patchy freezing drizzle possible' ||
        myweather!.status == 'Blowing snow') {
      color = Colors.blue;
      emit(SucessState());
    } else if (myweather!.status == 'Freezing fog' ||
        myweather!.status == 'Fog' ||
        myweather!.status == 'Heavy Cloud' ||
        myweather!.status == 'Mist' ||
        myweather!.status == 'Fog') {
      color = Colors.blueGrey;
      emit(SucessState());
    } else if (myweather!.status == 'Patchy rain possible' ||
        myweather!.status == 'Patchy rain nearby' ||
        myweather!.status == 'Heavy Rain' ||
        myweather!.status == 'Showers	') {
      color = Colors.blue;
      emit(SucessState());
    } else if (myweather!.status == 'Thundery outbreaks possible' ||
        myweather!.status == 'Moderate or heavy snow with thunder' ||
        myweather!.status == 'Patchy light snow with thunder' ||
        myweather!.status == 'Moderate or heavy rain with thunder' ||
        myweather!.status == 'Patchy light rain with thunder') {
      color = Colors.deepPurple;
      emit(SucessState());
    } else {
      color = Colors.orange;
      emit(SucessState());
    }
  }
}
