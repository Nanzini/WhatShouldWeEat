import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/restaurantState.dart';
import '../model/circleState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import '../event/event.dart';

class CircleBloc extends Bloc<CircleEvent, CircleState> {
  int angle = 0;
  int rotation = 0;
  // var  decodedData;
  CircleBloc(CircleState initialState) : super(initialState);
  CircleState state = CircleState();
  @override
  String toString() {}

  @override
  Stream<CircleState> mapEventToState(CircleEvent event) async* {
    switch (event) {
      case CircleEvent.btn_rotate:
        yield* _mapRotateToState();
        break;
      case CircleEvent.circleInit:
        yield* _mapInitToState();
        break;
    }
  }

  Stream<CircleState> _mapRotateToState() async* {
    var random = new Random();
    int turn = random.nextInt(5) + 8;
    final prefs = await SharedPreferences.getInstance();
    var lists1 = prefs.getString('lists');
    rotation += random.nextInt(360);
    angle = angle + turn * 360 + rotation;
    var decodedData = RestaurantState.decode(lists1);
    yield CircleState(angle: angle, rotation: rotation,list: decodedData);
  }
}

Stream<CircleState> _mapInitToState() async* {
  final prefs = await SharedPreferences.getInstance();
  var lists1 = prefs.getString('lists');

  // null일때
  if ((lists1 == null)) {
    var decodedData = restaurantData;
    final String encodedData = RestaurantState.encode(decodedData);
    prefs.setString('lists', encodedData);
    yield CircleState(list: decodedData);
  } else {
var decodedData = RestaurantState.decode(lists1);
    yield CircleState(list: decodedData);
  }

  // convert to map and modify

  // insert
}
