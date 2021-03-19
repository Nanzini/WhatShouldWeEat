import 'package:flutter_application_1/model/restaurantState.dart';

enum CircleEvent { btn_rotate }

// enum ListEvent { btn_add, btn_check }

class ListEvent {}

class ListCheck extends ListEvent {
  RestaurantState state;
  List<RestaurantState> list;
  ListCheck({this.state, this.list});

  @override
  String toString() {
    return ('$state');
  }
}
