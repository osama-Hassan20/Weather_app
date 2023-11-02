import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/layout/cubit/states.dart';
import 'package:weather_app/screen/search_view.dart';
import 'package:weather_app/shared/components/widgets/weather_info_body.dart';

import '../shared/components/components.dart';
import '../shared/components/widgets/no_weather_body.dart';
import 'cubit/cubit.dart';

class WeatherLayout extends StatelessWidget {
  const WeatherLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body:  BlocBuilder<WeatherCubit , WeatherStates>(
        builder: (context , state) =>ConditionalBuilder(
            condition: state is! GetWeatherDataLoadingStates,
            builder: (context) =>state is GetWeatherDataErrorStates
              ? Center(
                  child: Container(//e9fcff
                    color: Color(0xFFe9fcff),
                    height: double.infinity,
                    child: Image(
                      image: NetworkImage(
                          'https://img.freepik.com/free-vector/error-404-concept-landing-page_52683-18367.jpg?w=1060&t=st=1698672445~exp=1698673045~hmac=16c0a87b798bdd32950f7d4b7ad3d2c8376d72239c22f32260c8dd88e358262f'),
                    ),
                  ),
                )
              : WeatherCubit.get(context).weatherDataItem == null
                  ? NoWeatherBody()
                  : WeatherInfoBody(),
          fallback: (context) =>const Center(child: CircularProgressIndicator()),
    ),
      ),
      // body: Text('${WeatherCubit.get(context).weatherDataItem}'),
    );
  }
}
