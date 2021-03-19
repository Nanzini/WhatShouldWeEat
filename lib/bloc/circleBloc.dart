import 'dart:math';

import '../model/restaurantState.dart';
import '../model/circleState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import '../event/event.dart';

class CircleBloc extends Bloc<CircleEvent, CircleState> {
  int angle = 0;
  int rotation = 0;
  CircleBloc(CircleState initialState) : super(initialState);
  CircleState state = CircleState(0, 0);
  @override
  String toString() {}

  @override
  Stream<CircleState> mapEventToState(CircleEvent event) async* {
    switch (event) {
      case CircleEvent.btn_rotate:
        yield* _mapRotateToState();
        break;
    }
  }

  Stream<CircleState> _mapRotateToState() async* {
    var random = new Random();
    int turn = random.nextInt(5) + 8;

    rotation += random.nextInt(360);
    angle = angle + turn * 360 + rotation;
    yield state.update(angle: angle, rotation: rotation);
  }
}
