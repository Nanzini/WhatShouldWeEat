import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/circleBloc.dart';
import 'package:flutter_application_1/bloc/restaurantBloc.dart';

import 'package:flutter_application_1/model/circleState.dart';
import 'package:flutter_application_1/model/restaurantState.dart';
import 'package:flutter_application_1/pages/circlePage.dart';
import 'package:flutter_application_1/pages/listPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  CircleState state = CircleState(0, 0);
  RestaurantState rstate = RestaurantState(list: restaurantData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLOC PATTERN YOUNGMIN'),
        backgroundColor: Colors.amber[200],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          TextButton(
            child: Text('식당들'),
            onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => BlocProvider(
                      create: (BuildContext context) => ListBloc(rstate),
                      child: ListPage())))
            },
          ),
          ElevatedButton(
              child: Text('돌려'),
              onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => BlocProvider(
                            create: (BuildContext context) => CircleBloc(state),
                            child: CirclePage())))
                  })
        ],
      ),
    );
  }
}
