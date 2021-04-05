import 'dart:math';
import 'package:flutter/material.dart';

import 'restaurantState.dart';

class CircleState {
  List<dynamic> list;
  int angle;
  int rotation;
  CircleState({this.angle, this.rotation, this.list}) {
    // if (this.angle == null)
    //   this.angle = 3700;
    // else
    //   this.angle = angle;
    this.angle = this.angle ?? 0;
    this.rotation = this.rotation ?? 0;
    this.list = this.list ?? list;
  }

  CircleState update({int angle, int rotation}) {
    this.angle = angle;
    this.rotation = rotation;
    print('앵글과 각도 : $angle $rotation');
    return CircleState(angle: angle, rotation: rotation);
  }
}
