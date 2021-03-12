import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CirclePage.dart';
import 'circleBloc.dart';
import 'circleEvent.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MultiBlocProvider(
      providers: [
        BlocProvider<CircleBloc>(
          create: (BuildContext context) => CircleBloc(),
        ),
      ],
      child: CirclePage(),
    ));
  }
}
