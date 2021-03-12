import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:animated_rotation/animated_rotation.dart';
import 'circleBloc.dart';
import 'chartData.dart';
import 'circleEvent.dart';

class CirclePage extends StatelessWidget {
  // ignore: close_sinks

  @override
  Widget build(BuildContext context) {
    CircleBloc _circleBloc = BlocProvider.of<CircleBloc>(context);

    return Scaffold(
        body: Center(
          child: BlocBuilder<CircleBloc, int>(builder: (context, state) {
            return AnimatedRotation(
                angle: _circleBloc.rotation,
                child: Container(
                    child: SfCircularChart(
                        // tooltipBehavior: TooltipBehavior(enable: true),
                        series: <CircularSeries>[
                      PieSeries<ChartData, String>(
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          dataLabelMapper: (ChartData data, _) => data.x,

                          // Corner style of doughnut segment
                          // cornerStyle: CornerStyle.bothCurve,
                          dataLabelSettings: DataLabelSettings(
                              // labelPosition: ChartDataLabelPosition.outside,
                              isVisible: true,
                              // Renders background rectangle and fills it with series color
                              useSeriesColor: true)),
                    ])));
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _circleBloc.add(CircleEvent.btn_rotate);
            print(_circleBloc);
          },
          child: BlocBuilder<CircleBloc, int>(
            builder: (context, state) {
              return Text(
                '$state',
                style: TextStyle(fontSize: 50.0),
              );
            },
          ),
        ));
  }
}
