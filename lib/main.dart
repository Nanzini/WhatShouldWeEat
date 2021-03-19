import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/circleState.dart';
import 'package:flutter_application_1/pages/listPage.dart';
import 'package:flutter_application_1/pages/mainScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/restaurantBloc.dart';
import 'model/restaurantState.dart';
import 'pages/circlePage.dart';
import 'bloc/circleBloc.dart';
import 'event/event.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  CircleState state = CircleState(0, 0);
  RestaurantState rstate = RestaurantState();
  @override
  Widget build(BuildContext context) {
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
