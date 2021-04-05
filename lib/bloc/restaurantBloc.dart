import 'package:flutter_application_1/event/event.dart';
import 'package:flutter_application_1/model/circleState.dart';
import 'package:flutter_application_1/model/restaurantState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListBloc extends Bloc<ListEvent, RestaurantState> {
  ListBloc(RestaurantState initialState) : super(initialState);

  @override
  String toString() {}

  @override
  Stream<RestaurantState> mapEventToState(ListEvent event) async* {
    if (event is ListCheck) {
      yield* _mapCheckToState(event.state, event.list);
    } else if (event is ListRemove) {
      yield* _mapRemoveToState(event.state, event.list);
    } else if (event is ListUpdate) {
      yield* _mapUpdateToState(event.state, event.list);
    } else if (event is ListInit) {
      print('init');
      yield* _mapInitToState();
    } else if (event is Listchange) {
      yield* _mapChangeToState(
          event.state, event.list, event.str, event.portion);
    } else if (event is ListAdd) {
      yield* _mapAddToState(event.name, event.list);
    }
  }

  Stream<RestaurantState> _mapAddToState(
      String name, List<RestaurantState> list) async* {
    final prefs = await SharedPreferences.getInstance();

    list.add(RestaurantState(id: list.length, name: name));
    final String encodedData = RestaurantState.encode(list);
    prefs.setString('lists', encodedData);
    yield RestaurantState(list: list);
  }

  Stream<RestaurantState> _mapChangeToState(RestaurantState state,
      List<RestaurantState> list, String str, int portion) async* {
    final prefs = await SharedPreferences.getInstance();
    str = str ?? state.name;
    portion = portion ?? state.portion;
    list[state.id].name = str;
    list[state.id].portion = portion;
    final String encodedData = RestaurantState.encode(list);
    prefs.setString('lists', encodedData);
    yield RestaurantState(list: list);
  }

  Stream<RestaurantState> _mapInitToState() async* {
    final prefs = await SharedPreferences.getInstance();
    var lists1 = prefs.getString('lists');

    // null일때
    if ((lists1 == null)) {
      var decodedData = restaurantData;
      final String encodedData = RestaurantState.encode(decodedData);
      prefs.setString('lists', encodedData);
      yield RestaurantState(list: decodedData);
    } else {
      print('현재 프리퍼 ${lists1}');
      prefs.setString('lists', lists1);
      var decodedData = RestaurantState.decode(lists1);
      yield RestaurantState(list: decodedData);
    }

    // convert to map and modify

    // insert
  }

  Stream<RestaurantState> _mapCheckToState(
      RestaurantState state, List<RestaurantState> list) async* {
    final prefs = await SharedPreferences.getInstance();
    list[state.id].checked = !state.checked;

    final String encodedData = RestaurantState.encode(list);
    prefs.setString('lists', encodedData);
    yield RestaurantState(list: list);
  }

  Stream<RestaurantState> _mapUpdateToState(
      RestaurantState state, List<RestaurantState> list) async* {
    final prefs = await SharedPreferences.getInstance();
    print('bloc : ${state.name} ${state.portion}');
    list[state.id].name = state.name;
    list[state.id].portion = state.portion;

    final String encodedData = RestaurantState.encode(list);
    prefs.setString('lists', encodedData);
    yield RestaurantState(list: list);
  }

  Stream<RestaurantState> _mapRemoveToState(
      RestaurantState state, List<RestaurantState> list) async* {
    final prefs = await SharedPreferences.getInstance();
    list.remove(list[state.id]);
    for (int i = 0; i < list.length; i++) {
      list[i].id = i;
    }
    final String encodedData = RestaurantState.encode(list);
    prefs.setString('lists', encodedData);
    yield RestaurantState(list: list);
  }
}
