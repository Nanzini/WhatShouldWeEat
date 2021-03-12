import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'circleEvent.dart';

class CircleBloc extends Bloc<CircleEvent, int> {
  @override
  String toString() {
    return "123 $rotation";
  }

  var rotation = 7000000;

  CircleBloc({int rotation}) : super(rotation = 10);

  @override
  Stream<int> mapEventToState(CircleEvent event) async* {
    switch (event) {
      case CircleEvent.btn_rotate:
        rotation = 2 * rotation;
        yield rotation;
        break;
    }
  }
}
