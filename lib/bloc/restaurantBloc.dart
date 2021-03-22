import 'package:flutter_application_1/event/event.dart';
import 'package:flutter_application_1/model/circleState.dart';
import 'package:flutter_application_1/model/restaurantState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBloc extends Bloc<ListEvent, RestaurantState> {
  ListBloc(RestaurantState initialState) : super(initialState);

  @override
  String toString() {}

  @override
  Stream<RestaurantState> mapEventToState(ListEvent event) async* {
    if (event is ListCheck) {
      yield* _mapAddToState(event.state, event.list);
    } else if (event is ListRemove) {
      yield* _mapRemoveToState(event.state, event.list);
    }
  }

  Stream<RestaurantState> _mapAddToState(
      RestaurantState state, List<RestaurantState> list) async* {
    yield state.update(state: state, list: list);
  }

  Stream<RestaurantState> _mapRemoveToState(
      RestaurantState state, List<RestaurantState> list) async* {
    // yield state.remove(state: state, list: list);
  }
}
