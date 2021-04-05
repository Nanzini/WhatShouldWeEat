import 'package:flutter_application_1/model/restaurantState.dart';

enum CircleEvent { btn_rotate, circleInit }

// enum ListEvent { btn_add, btn_check }

class ListEvent {}

class ListCheck extends ListEvent {
  RestaurantState state;
  List<RestaurantState> list;
  ListCheck({this.state, this.list, String str});
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

class ListAdd extends ListEvent {
  String name;
  List<RestaurantState> list;
  ListAdd({this.name, this.list});
}

class ListInit extends ListEvent {
  ListInit();
}

class Listchange extends ListEvent {
  RestaurantState state;
  List<RestaurantState> list;
  String str;
  int portion;
  Listchange({this.state, this.list, this.str, this.portion});
}
