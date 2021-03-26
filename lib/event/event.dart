import 'package:flutter_application_1/model/restaurantState.dart';

enum CircleEvent { btn_rotate }

// enum ListEvent { btn_add, btn_check }

class ListEvent {}

class ListCheck extends ListEvent {
  RestaurantState state;
  List<RestaurantState> list;
  ListCheck({this.state, this.list});
}

class ListRemove extends ListEvent {
  RestaurantState state;
  List<RestaurantState> list;
  ListRemove({this.state, this.list});
}

class ListUpdate extends ListEvent {
  RestaurantState state;
  List<RestaurantState> list;
  ListUpdate({this.state, this.list});
}

class ListInit extends ListEvent {
  RestaurantState state;
  List<RestaurantState> list;
  ListInit({this.state, this.list});
}
