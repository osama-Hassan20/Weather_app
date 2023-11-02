import 'package:flutter/material.dart';

import '../../../layout/cubit/cubit.dart';
import '../components.dart';
import 'package:intl/intl.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String temperatureText = temperature.toString() + '\u00B0';
    var dataWeather =WeatherCubit.get(context).weatherDataItem!;
    DateTime x = DateTime.parse( dataWeather['forecast']['forecastday'][1]['date']);
    String dateName = DateFormat('EEEE').format(DateTime.parse( dataWeather['forecast']['forecastday'][1]['date']));
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              getThemeColor(context),
              getThemeColor(context)[400]!,
              getThemeColor(context)[300]!,
              getThemeColor(context)[200]!,
              getThemeColor(context)[100]!,
              getThemeColor(context)[50]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 32,
          ),
           Text(
        '${dataWeather['location']['name']}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
             textAlign: TextAlign.center,
          ),
           Text(
             // '${DateTime.now().hour}',


            '${DateFormat('EEEE').format(DateTime.parse( dataWeather['forecast']['forecastday'][0]['date']))} at:  ${DateTime.parse( dataWeather['current']['last_updated']).hour}:${DateTime.parse( dataWeather['current']['last_updated']).minute}',
            style: TextStyle(
              fontSize: 24,
            ),
          ),

          Image.network(
            'https:${dataWeather['current']['condition']['icon']}',
            fit: BoxFit.cover,
            height: 200,

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                // 'Maxtemp: 24',
                'Maxtemp: ${dataWeather['forecast']['forecastday'][0]['day']['maxtemp_c'].round()}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
               Text(
                '${dataWeather['forecast']['forecastday'][0]['day']['avgtemp_c'].toString() + '\u00B0'}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
               Text(
                 'Mintemp: ${dataWeather['forecast']['forecastday'][0]['day']['mintemp_c'].round()}',
                 style: TextStyle(
                   fontSize: 16,
                 ),
               ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
           Text(
             '${dataWeather['forecast']['forecastday'][0]['day']['condition']['text']}',
             style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: Container(
              // height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                ),
                  // color: Colors.grey
                  gradient: LinearGradient(
                    colors: [
                      Colors.teal,
                      Colors.teal[400]!,
                      Colors.teal[300]!,
                      Colors.teal[200]!,
                      Colors.teal[100]!,
                      Colors.teal[50]!,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                  ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https:${dataWeather['forecast']['forecastday'][index+1]['day']['condition']['icon']}',
                          fit: BoxFit.cover,
                        ),
                        Text(
                          '${DateFormat('EEEE').format(DateTime.parse( dataWeather['forecast']['forecastday'][index+1]['date']))}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${dataWeather['forecast']['forecastday'][index+1]['day']['avgtemp_c'].toString() + '\u00B0'}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),

                      ],
                    ),
                  ),

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Widget x()=>ListView.builder(
//   itemCount: categories.length,
//   scrollDirection: Axis.horizontal,
//   itemBuilder: (context, index) => CategoryCard(category: categories[index],),
//
// ),