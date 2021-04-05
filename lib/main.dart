import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/circleState.dart';
import 'package:flutter_application_1/model/restaurantState.dart';
import 'package:flutter_application_1/pages/listPage.dart';
import 'package:flutter_application_1/pages/mainScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/restaurantBloc.dart';
import 'model/restaurantState.dart';
import 'model/restaurantState.dart';
import 'model/restaurantState.dart';
import 'pages/circlePage.dart';
import 'bloc/circleBloc.dart';
import 'event/event.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  CircleState state = CircleState();
  RestaurantState rstate = RestaurantState();

  @override
  Widget build(BuildContext context) {
    // setup(encodedData);
    return MaterialApp(
        home: MultiBlocProvider(
      providers: [
        BlocProvider<CircleBloc>(
          create: (BuildContext context) => CircleBloc(state),
        ),
        BlocProvider<ListBloc>(
          create: (BuildContext context) => ListBloc(rstate),
        )
      ],
      child: MainScreen(),
    ));
  }
}

Future<String> getData() async {
  final prefs = await SharedPreferences.getInstance();
  final String encodedData = RestaurantState.encode(restaurantData);

  String lists = prefs.getString('lists');
  lists == null ? encodedData : lists;
  prefs.setString('lists', lists);
  print('초기값 : ' + prefs.getString('lists'));
  return lists;
}

dynamic map() async {
  final prefs = await SharedPreferences.getInstance();
  String lists = prefs.getString('lists');
  // map
  var decodedData = RestaurantState.decode(lists);
  decodedData[0].name = '영민미안';

  final String encodedData = RestaurantState.encode(decodedData);
  prefs.setString('lists', encodedData);
  print(prefs.getString('lists'));
  return decodedData;
  // String encodedData = RestaurantState.encode(decodedData);
  // prefs.setString('lists', encodedData);
  // print(prefs.getString('lists'));
}
