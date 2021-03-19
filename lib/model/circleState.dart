import 'dart:math';
import 'package:flutter/material.dart';

import 'restaurantState.dart';

class CircleState {
  int angle;
  int rotation;
  CircleState(int angle, int rotation) {
    // if (this.angle == null)
    //   this.angle = 3700;
    // else
    //   this.angle = angle;
    this.angle = this.angle ?? angle;
    this.rotation = this.rotation ?? rotation;
  }

  CircleState update({int angle, int rotation}) {
    this.angle = angle;
    this.rotation = rotation;
    print('앵글과 각도 : $angle $rotation');
    return CircleState(this.angle, this.rotation);
  }
}
