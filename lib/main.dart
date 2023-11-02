import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/layout/cubit/states.dart';
import 'package:weather_app/shared/components/components.dart';
import 'package:weather_app/shared/components/constant.dart';
import 'package:weather_app/shared/network/remote/dio_helper.dart';

import 'layout/cubit/cubit.dart';
import 'layout/weather_layoyt.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherCubit(),
      child:  BlocBuilder<WeatherCubit , WeatherStates>(
        builder: (context , state) {
          return  WeatherMaterialApp();
        },

      ),
    );
  }
}
class WeatherMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: WeatherCubit.get(context).weatherDataItem == null ? Colors.blue : getThemeColor(context),
      ),
      home: WeatherLayout(),
    );
  }
}