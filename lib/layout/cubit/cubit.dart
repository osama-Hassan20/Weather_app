import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/layout/cubit/states.dart';
import '../../shared/network/remote/dio_helper.dart';

class WeatherCubit extends Cubit<WeatherStates>
{
  WeatherCubit() : super (WeatherInitialState(),);

  static WeatherCubit get(context) => BlocProvider.of(context);

//https://api.weatherapi.com/
// v1/forecast.json?
// key=4a5cc1694e154f0b80a131045232910
// &q=London&aqi=no&alerts=no

  Map<String, dynamic>? weatherDataItem;

  void getData(String value){
    weatherDataItem = null;
    emit(GetWeatherDataLoadingStates());
    DioHelper.getData(
        url:'v1/forecast.json' ,
        query:
        {
          'q': value,
          'days': '7',
          'aqi': 'no',
          'alerts': 'no',
          'key': '4a5cc1694e154f0b80a131045232910',
        },
    ).then((value) {
      weatherDataItem =value?.data;
      print(weatherDataItem!['location']['name']);
      print(weatherDataItem!['forecast']['forecastday'][0]['day']['condition']['text']);
      print(weatherDataItem!['current']['condition']['icon']);
      print(weatherDataItem!['forecast']['forecastday'][0]['day']['maxtemp_c']);
      print(weatherDataItem!['forecast']['forecastday'][0]['day']['mintemp_c']);
      print(weatherDataItem!['forecast']['forecastday'][0]['day']['avgtemp_c']);

      emit(GetWeatherDataSuccessStates(),);
    }).catchError((error){
      emit(GetWeatherDataErrorStates(error.toString(),),);
      print(error.toString(),);
    });
  }

  // List<dynamic> search =[];
  //
  // void getSearch(String value){
  //   emit(WeatherGetSearchLoadingStates());
  //   search =[];
  //
  //   DioHelper.getData(
  //     url:'v2/everything' ,
  //     query:{
  //
  //       'q':value,
  //       'apiKey':'5d9b02d51b0446f3b5095e818afbdb1e',
  //     },
  //   ) .then((value) {
  //     search =value?.data['articles'];
  //     print(search[0]['title']);
  //     emit(WeatherGetSearchSuccessStates(),);
  //   }).catchError((error){
  //     emit(WeatherGetSearchErrorStates(error.toString(),),);
  //     print(error.toString(),);
  //   });


  }
