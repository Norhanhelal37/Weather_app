class WeatherModel {
  String status;
  String image;
  double avgtemp;
  double mintemp;
  double maxtemp;
  List<dynamic> forcast;

  WeatherModel(
      {required this.status,
      required this.image,
      required this.avgtemp,
      required this.mintemp,
      required this.maxtemp,
      required this.forcast});

  factory WeatherModel.fetchdata(dynamic data) {
    return WeatherModel(
        status: data["current"]["condition"]["text"],
        image: data["current"]["condition"]["icon"],
        avgtemp: data["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        mintemp: data["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        maxtemp: data["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        forcast: data["forecast"]["forecastday"]);
  }

  String getImage(String state) {
    if (state == 'Sunny' || state == 'Clear' || state == 'Partly cloudy') {
      return 'assets/images/clear.png';
    } else if (state == 'Blizzard' ||
        state == 'Patchy snow possible' ||
        state == 'Patchy sleet possible' ||
        state == 'Patchy freezing drizzle possible' ||
        state == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (state == 'Freezing fog' ||
        state == 'Fog' ||
        state == 'Heavy Cloud' ||
        state == 'Mist' ||
        state == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (state == 'Patchy rain possible' ||
        state == "Patchy rain nearby"||
        state == 'Heavy Rain' ||
        state == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (state == 'Thundery outbreaks possible' ||
        state == 'Moderate or heavy snow with thunder' ||
        state == 'Patchy light snow with thunder' ||
        state == 'Moderate or heavy rain with thunder' ||
        state == 'Patchy light rain with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
}
