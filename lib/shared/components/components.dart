
import 'package:flutter/material.dart';

import '../../layout/cubit/cubit.dart';

MaterialColor getThemeColor(context ) {
  var dataWeatherConditionName =WeatherCubit.get(context).weatherDataItem!['forecast']['forecastday'][0]['day']['condition']['text'];
  if (dataWeatherConditionName == 'Sunny' || dataWeatherConditionName == 'Clear' ||  dataWeatherConditionName == 'partly cloudy') {
    return Colors.orange;
  } else if (

  dataWeatherConditionName == 'Blizzard' ||  dataWeatherConditionName == 'Patchy snow possible'  ||  dataWeatherConditionName == 'Patchy sleet possible' || dataWeatherConditionName == 'Patchy freezing drizzle possible' || dataWeatherConditionName == 'Blowing snow') {
    return Colors.blue;
  } else if (dataWeatherConditionName == 'Freezing fog' || dataWeatherConditionName == 'Fog' ||  dataWeatherConditionName == 'Heavy Cloud' || dataWeatherConditionName == 'Mist' || dataWeatherConditionName == 'Fog') {
    return Colors.blueGrey;
  } else if (dataWeatherConditionName == 'Patchy rain possible' ||
      dataWeatherConditionName == 'Heavy Rain' ||
      dataWeatherConditionName == 'Showers	') {
    return Colors.blue;
  } else if (dataWeatherConditionName == 'Thundery outbreaks possible' || dataWeatherConditionName == 'Moderate or heavy snow with thunder' || dataWeatherConditionName == 'Patchy light snow with thunder'|| dataWeatherConditionName == 'Moderate or heavy rain with thunder' || dataWeatherConditionName == 'Patchy light rain with thunder' ) {
    return Colors.deepPurple;
  } else {
    return Colors.orange;
  }
}