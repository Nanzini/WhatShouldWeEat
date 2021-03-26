import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/mainScreen.dart';
import 'package:localstorage/localstorage.dart';

import '../main.dart';

class RestaurantState {
  bool isLoad;
  List<RestaurantState> list;
  int id;
  String name;
  int portion;
  bool checked;
  Color color;
  RestaurantState(
      {this.isLoad = true,
      this.id,
      this.name,
      this.portion,
      this.checked,
      this.color,
      this.list}) {
    this.portion = portion ?? 10;
    this.checked = checked ?? true;
    ;
  }

  factory RestaurantState.fromJson(Map<String, dynamic> jsonData) {
    return RestaurantState(
      isLoad: false,
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
  // factory RestaurantState.empty() {
  //   return RestaurantState(list: [
  //     RestaurantState(id: 0, name: '까사미아W'),
  //     RestaurantState(id: 1, name: '소담'),
  //     RestaurantState(id: 2, name: '버거킹'),
  //     RestaurantState(id: 3, name: 'KFC'),
  //     RestaurantState(id: 4, name: '취쓰부'),
  //     RestaurantState(id: 5, name: '윤가네'),
  //     RestaurantState(id: 6, name: '킹콩부대'),
  //     RestaurantState(id: 7, name: '밥도둑'),
  //     RestaurantState(id: 8, name: '고릴라김밥'),
  //     RestaurantState(id: 9, name: '더족발'),
  //     RestaurantState(id: 10, name: '명동할매'),
  //     RestaurantState(id: 11, name: '굴향'),
  //     RestaurantState(id: 12, name: '육전면'),
  //   ]);
  // }

  RestaurantState check({RestaurantState state, List<RestaurantState> list}) {
    list[state.id].checked = !state.checked;
    var getData = localStorage.getItem('lists');

    localStorage.setItem('lists', list);
    return RestaurantState(isLoad: false, list: list);
  }

  RestaurantState update({RestaurantState state, List<RestaurantState> list}) {
    print('이전 ${list[state.id].name} ${list[state.id].portion}');
    // 다이얼로그에서 데이터받ㄷ아야함
    list[state.id].name = state.name;
    list[state.id].portion = state.portion;

    // // LOCAL SETTING REMOVE LIST째로 넣기
    print('이후 ${list[state.id].name} ${list[state.id].portion}');
    return RestaurantState(isLoad: false, list: list);
  }

  RestaurantState remove({RestaurantState state, List<RestaurantState> list}) {
    // LOCAL SETTING REMOVE
    // LocalStorage storage = LocalStorage(key);
    list.remove(list[state.id]);
    for (int i = 0; i < list.length; i++) {
      list[i].id = i;
    }
    return RestaurantState(isLoad: false, list: list);
  }

  static RestaurantState init(List<RestaurantState> list) {
    return RestaurantState(isLoad: true, list: list);
  }
}

List<RestaurantState> restaurantData = [
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
List<RestaurantState> restaurantData1 = [
  RestaurantState(id: 0, name: '까사미아'),
  RestaurantState(id: 1, name: '소담'),
  RestaurantState(id: 2, name: '버거킹'),
  RestaurantState(id: 3, name: 'KFC')
];
