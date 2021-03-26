import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/circleState.dart';
import 'package:flutter_application_1/pages/listPage.dart';
import 'package:flutter_application_1/pages/mainScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';

import 'bloc/restaurantBloc.dart';
import 'model/restaurantState.dart';
import 'pages/circlePage.dart';
import 'bloc/circleBloc.dart';
import 'event/event.dart';

LocalStorage localStorage = LocalStorage('ym');
getItems() async {
  final LocalStorage localStorage = new LocalStorage('ym');

  final data = await localStorage.getItem('lists');
  print('get : $data');
}

initItems() async {
  final LocalStorage localStorage = new LocalStorage('ym');

  var data = await localStorage.getItem('lists');
  var tmp = await localStorage.getItem('tmp');
  data = (data == null) ? restaurantData : data;
  await localStorage.setItem('lists', data);

  tmp = (tmp == null) ? 'none' : 'exosting';
  await localStorage.setItem('tmp', tmp);
  var data1 = await localStorage.getItem('lists');
  print(data1);
}

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CircleState state = CircleState(0, 0);
    initItems();
    getItems();

    // dynamic getData = localStorage.getItem('lists');
    // var lists = (getData == null) ? restaurantData : getData;
    // localStorage.setItem('lists', lists);
    // RestaurantState rstate = RestaurantState.init(lists);
    // var lists = localInit();

    // var ready = await localStorage.ready;

    var getData = localStorage.getItem('lists');
    var lists = (getData == null) ? restaurantData : getData;

    RestaurantState rstate = RestaurantState.init(lists);

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

Future<RestaurantState> localInit() async {
  var ready = await localStorage.ready;

  var myList = [
    RestaurantState(id: 0, name: '까사미아'),
    RestaurantState(id: 1, name: '소담'),
  ];

  dynamic getData = localStorage.getItem('lists');
  var lists = (getData == null) ? restaurantData : getData;
  RestaurantState rstate = RestaurantState.init(lists);
  return rstate;
}

void printStorage() async {
  //this will still print null:
  print("before ready: " + localStorage.getItem("level").toString());

  //wait until ready
  await localStorage.ready;

  //this will now print 0
  print("after ready: " + localStorage.getItem("level").toString());
}
