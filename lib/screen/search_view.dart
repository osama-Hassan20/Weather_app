import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layout/cubit/cubit.dart';
import '../layout/cubit/states.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit , WeatherStates>(
      builder: (context , state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Search City'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Center(
              child: TextField(
                onSubmitted: (value){
                  WeatherCubit.get(context).getData(value);
                  Navigator.pop(context);
                  print('object');
                  print(WeatherCubit.get(context).weatherDataItem);
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 32,
                        horizontal: 16
                    ),
                    labelText: 'Search',
                    hintText: 'Enter City Name',
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),

                    )
                ),
                onTapOutside: (event){
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
            ),
          ),
        );
      },

    );
  }
}
