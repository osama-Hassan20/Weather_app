import 'package:dio/dio.dart';

class DioHelper{
  //https://api.weatherapi.com/
  // v1/forecast.json?
  // key=4a5cc1694e154f0b80a131045232910
  // &q=lon
  // &aqi=no
  // &alerts=no
  static Dio? dio;//https://api.weatherapi.com/v1/forecast.json?key=4a5cc1694e154f0b80a131045232910&q=lon&aqi=no&alerts=no
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl:'https://api.weatherapi.com/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getData({
    required String? url,
     Map<String,dynamic>? query,
})async
  {
    return await dio?.get(
      url!,
      queryParameters: query,
    );
  }


}