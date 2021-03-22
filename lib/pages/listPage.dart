import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/restaurantBloc.dart';
import 'package:flutter_application_1/event/event.dart';
import 'package:flutter_application_1/model/restaurantState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListBloc _listBloc = BlocProvider.of<ListBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('식당리스트'), // 디바이스 위에 그려진ㄴ건 text클래스 써야함
          backgroundColor: Colors.black12,
          centerTitle: true,
          elevation: 0.0, // 앱바 밑부분의 테두리 높이로 이ㅣㄴ한 그림자없애줌 z축 0으로
        ),
        body: Center(child:
            BlocBuilder<ListBloc, RestaurantState>(builder: (context, state) {
          return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: state.list.length,
              itemBuilder: (BuildContext context, int index) {
                return List(state.list[index], context, _listBloc);
              });
        })));
  }
}

Container List(
    RestaurantState restaurantData, BuildContext context, ListBloc _listBloc) {
  return Container(
      margin: const EdgeInsets.all(4),
      child: Row(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text('${restaurantData.name}')),

          // check버튼으로 바꾸기
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Increase volume by 10',
            onPressed: () {
              _listBloc.add(
                  ListCheck(state: restaurantData, list: _listBloc.state.list));
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Increase volume by 10',
            onPressed: () {
              _listBloc.add(ListRemove(
                  state: restaurantData, list: _listBloc.state.list));
            },
          )
        ],
      ));
}
