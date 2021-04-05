import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantState {
  List<dynamic> list;
  int id;
  String name;
  int portion;
  bool checked;
  Color color;
  RestaurantState(
      {this.id, this.name, this.portion, this.checked, this.color, this.list}) {
    this.portion = portion ?? 10;
    this.checked = checked ?? true;
  }

  RestaurantState check({RestaurantState state, List<RestaurantState> list}) {
    list[state.id].checked = !state.checked;

    return RestaurantState(list: list);
  }

  RestaurantState update({RestaurantState state, List<RestaurantState> list}) {
    print('이전 ${list[state.id].name} ${list[state.id].portion}');
    // 다이얼로그에서 데이터받ㄷ아야함
    list[state.id].name = state.name;
    list[state.id].portion = state.portion;
    print('이후 ${list[state.id].name} ${list[state.id].portion}');
    return RestaurantState(list: list);
  }

  RestaurantState remove({RestaurantState state, List<RestaurantState> list}) {
    print('${list[state.id].name}');
    list.remove(list[state.id]);
    for (int i = 0; i < list.length; i++) {
      list[i].id = i;
    }
    return RestaurantState(list: list);
  }

  factory RestaurantState.fromJson(Map<String, dynamic> jsonData) {
    return RestaurantState(
      id: jsonData['id'],
      portion: jsonData['portion'],
      name: jsonData['name'],
      checked: jsonData['checked'],
    );
  }

  static Map<String, dynamic> toMap(RestaurantState restaurant) => {
        'id': restaurant.id,
        'name': restaurant.name,
        'checked': restaurant.checked,
        'portion': restaurant.portion,
      };

  static String encode(List<RestaurantState> rests) => json.encode(
        rests
            .map<Map<String, dynamic>>((rest) => RestaurantState.toMap(rest))
            .toList(),
      );

  static List<RestaurantState> decode(String rests) =>
      (json.decode(rests) as List<dynamic>)
          .map<RestaurantState>((item) => RestaurantState.fromJson(item))
          .toList();
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
