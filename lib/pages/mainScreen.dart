import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/circleBloc.dart';
import 'package:flutter_application_1/bloc/restaurantBloc.dart';

import 'package:flutter_application_1/model/circleState.dart';
import 'package:flutter_application_1/model/restaurantState.dart';
import 'package:flutter_application_1/pages/circlePage.dart';
import 'package:flutter_application_1/pages/listPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  /* GET다제! list:getlocalstorage하기.
     여기 rstate가 다음 페이지로 데이터 넘겨주는 역할한다. 
    mainscreen.dart에서 데이터 작업이 끝나야해 
    rstate : RestuarantState.list = rstdata들어가잇네. 
    */
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
              // listpage로 넘어간 블럭은 rstate기반으로 데이터생성됨
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
