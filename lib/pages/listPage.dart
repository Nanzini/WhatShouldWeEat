import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/bloc/restaurantBloc.dart';
import 'package:flutter_application_1/event/event.dart';
import 'package:flutter_application_1/model/restaurantState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    print('listpage state');
    context.read<ListBloc>().add(ListInit());
  }

  @override
  Widget build(BuildContext context) {
    ListBloc _listBloc = BlocProvider.of<ListBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("식당 리스트"),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                _displayDialogAdd(context, _listBloc);
              },
              child: Text("식당추가"),
            ),
          ],
        ),
        body: Center(child:
            // state는 restaurantstate가 들어가잇음/
            BlocBuilder<ListBloc, RestaurantState>(builder: (context, state) {
          print(state);
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
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width * 0.58,
              child: Text('${restaurantData.name}')),

          // check버튼으로 바꾸기
          IconButton(
            icon: restaurantData.checked == true
                ? Icon(Icons.check_rounded)
                : Icon(Icons.add),
            tooltip: '돌림판에 추가하기',
            color:
                restaurantData.checked == true ? Colors.blue[200] : Colors.grey,
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
            color: Colors.amber[200],
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: '삭제',
            onPressed: () {
              _listBloc.add(ListRemove(
                  state: restaurantData, list: _listBloc.state.list));
            },
            color: Colors.red,
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
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.width / 4,
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (String text) {
                      _listBloc.add(Listchange(
                          state: data, list: _listBloc.state.list, str: text));
                    },
                    controller: dialogName,
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(hintText: '이름 : ${data.name}'),
                  ),
                  TextFormField(
                    controller: dialogPortion,
                    onChanged: (String text) {
                      // ignore: unused_element
                      _listBloc.add(Listchange(
                          state: data,
                          list: _listBloc.state.list,
                          portion: int.parse(text)));
                    },
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
            // ElevatedButton(
            //     child: Text('완료'),
            //     onPressed: () {
            //       data.name =
            //           (dialogName.text == "") ? data.name : dialogName.text;
            //       data.portion = (dialogPortion.text == "")
            //           ? data.portion
            //           : int.parse(dialogPortion.text);
            //       print('widget : ${data.name} ${data.portion}');
            //       _listBloc
            //           .add(ListUpdate(state: data, list: _listBloc.state.list));
            //       Navigator.of(context).pop();
            //     }),
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

_displayDialogAdd(BuildContext context, ListBloc _listBloc) async {
  return showDialog(
      context: context,
      builder: (context) {
        final dialogName = TextEditingController();
        String data;
        return AlertDialog(
          title: Text('식당 추가'),
          content: Container(
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.width / 4,
              child: Column(
                children: [
                  TextFormField(
                    controller: dialogName,
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(hintText: '이름'),
                  ),
                ],
              )),
          actions: <Widget>[
            ElevatedButton(
                child: Text('완료'),
                onPressed: () {
                  data = (dialogName.text == "") ? data : dialogName.text;
                  _listBloc
                      .add(ListAdd(name: data, list: _listBloc.state.list));
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
