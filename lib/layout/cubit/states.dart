abstract class WeatherStates{}

class WeatherInitialState extends WeatherStates{}

// states is about GetWeatherData
class GetWeatherDataLoadingStates extends WeatherStates {}

class GetWeatherDataSuccessStates extends WeatherStates {}

class GetWeatherDataErrorStates extends WeatherStates {
  final String error;
  GetWeatherDataErrorStates(this.error);
}


// states is about GetSearch
class WeatherGetSearchLoadingStates extends WeatherStates {}

class WeatherGetSearchSuccessStates extends WeatherStates {}

class WeatherGetSearchErrorStates extends WeatherStates {
  late final String error;
  WeatherGetSearchErrorStates(this.error);
}