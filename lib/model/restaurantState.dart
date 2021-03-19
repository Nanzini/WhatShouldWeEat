import 'package:flutter/material.dart';

class RestaurantState {
  List<RestaurantState> list;
  int id;
  String name;
  int portion;
  bool checked;
  Color color;
  RestaurantState(
      {this.id, this.name, this.portion, this.checked, this.color, this.list}) {
    this.portion = portion ?? 1;
    this.checked = checked ?? true;
  }

  factory RestaurantState.empty() {
    return RestaurantState(list: [
      RestaurantState(id: 0, name: '까사미아W'),
      RestaurantState(id: 1, name: '소담'),
      RestaurantState(id: 2, name: '버거킹'),
      RestaurantState(id: 3, name: 'KFC'),
      RestaurantState(id: 4, name: '취쓰부'),
      RestaurantState(id: 5, name: '윤가네'),
      RestaurantState(id: 6, name: '킹콩부대'),
      RestaurantState(id: 7, name: '밥도둑'),
      RestaurantState(id: 8, name: '고릴라김밥'),
      RestaurantState(id: 9, name: '더족발'),
      RestaurantState(id: 10, name: '명동할매'),
      RestaurantState(id: 11, name: '굴향'),
      RestaurantState(id: 12, name: '육전면'),
    ]);
  }
  RestaurantState update({RestaurantState state, List<RestaurantState> list}) {
    state.checked = checked;

    for (int i = 0; i < list.length; i++) {
      if (state.id == i) {
        list[i].name = '123';
        print('${list[i].name}');
        print('${list[i].checked}');
        return RestaurantState(id: 1, name: '123123');
      } else {}
    }
  }

  void state(String name) {}
}

final List<RestaurantState> restaurantData = [
  RestaurantState(id: 0, name: '까사미아'),
  RestaurantState(id: 1, name: '소담'),
  RestaurantState(id: 2, name: '버거킹'),
  RestaurantState(id: 3, name: 'KFC'),
  RestaurantState(id: 4, name: '취쓰부'),
  RestaurantState(id: 5, name: '윤가네'),
  RestaurantState(id: 6, name: '킹콩부대'),
  RestaurantState(id: 7, name: '밥도둑'),
  RestaurantState(id: 8, name: '고릴라김밥'),
  RestaurantState(id: 9, name: '더족발'),
  RestaurantState(id: 10, name: '명동할매'),
  RestaurantState(id: 11, name: '굴향'),
  RestaurantState(id: 12, name: '육전면'),
];
