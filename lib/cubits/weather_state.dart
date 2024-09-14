abstract class WeatherState {}

class InitialState extends WeatherState{}

class LoadingState extends WeatherState{}

class SucessState extends WeatherState{}

class FailureState extends WeatherState{}