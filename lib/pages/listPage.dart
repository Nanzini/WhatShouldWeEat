import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            // state는 restaurantstate가 들어가잇음/
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
            icon: restaurantData.checked == true
                ? Icon(Icons.check_rounded)
                : Icon(Icons.add),
            tooltip: '돌림판에 추가하기',
            onPressed: () {
              _listBloc.add(
                  ListCheck(state: restaurantData, list: _listBloc.state.list));
            },
          ),
          IconButton(
            icon: const Icon(Icons.brush_rounded),
            tooltip: '수정',
            onPressed: () {
              _displayDialog(context, restaurantData, _listBloc);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: '삭제',
            onPressed: () {
              _listBloc.add(ListRemove(
                  state: restaurantData, list: _listBloc.state.list));
            },
          )
        ],
      ));
}

_displayDialog(
    BuildContext context, RestaurantState data, ListBloc _listBloc) async {
  return showDialog(
      context: context,
      builder: (context) {
        final dialogName = TextEditingController();
        final dialogPortion = TextEditingController();
        return AlertDialog(
          title: Text('식당 수정'),
          content: Container(
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.width / 5,
              child: Column(
                children: [
                  TextField(
                    controller: dialogName,
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(hintText: '이름 : ${data.name}'),
                  ),
                  TextField(
                    controller: dialogPortion,
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration:
                        InputDecoration(hintText: '가중치 : ${data.portion}'),
                  ),
                ],
              )),
          actions: <Widget>[
            ElevatedButton(
                child: Text('완료'),
                onPressed: () {
                  data.name =
                      (dialogName.text == "") ? data.name : dialogName.text;
                  data.portion = (dialogPortion.text == "")
                      ? data.portion
                      : int.parse(dialogPortion.text);
                  _listBloc
                      .add(ListUpdate(state: data, list: _listBloc.state.list));
                  Navigator.of(context).pop();
                }),
            ElevatedButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}
