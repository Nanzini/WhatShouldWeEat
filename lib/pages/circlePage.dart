import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_rotation/animated_rotation.dart';
import 'package:particles_flutter/particles_flutter.dart';

import '../bloc/circleBloc.dart';
import '../model/circleState.dart';
import '../event/event.dart';
import '../model/restaurantState.dart';

class CirclePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CircleBloc _circleBloc = BlocProvider.of<CircleBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('돌려'), // 디바이스 위에 그려진ㄴ건 text클래스 써야함
          backgroundColor: Colors.black12,
          centerTitle: true,
          elevation: 0.0, // 앱바 밑부분의 테두리 높이로 이ㅣㄴ한 그림자없애줌 z축 0으로
        ),

        // body design
        backgroundColor: Colors.grey[600],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/knife.png",
              width: MediaQuery.of(context).size.width * 0.21,
              height: MediaQuery.of(context).size.width * 0.21,
            ),
            BlocBuilder<CircleBloc, CircleState>(builder: (context, state) {
              return Container(
                margin: EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width * 0.9 * 5,
                height: MediaQuery.of(context).size.height * 0.65,
                child: AnimatedRotation(
                    angle: state.angle,
                    duration: Duration(seconds: 5),
                    curve: Curves.easeInOut, // in out이E 부드럽게
                    child: Container(
                        child: SfCircularChart(

                            // tooltipBehavior: TooltipBehavior(enable: true),
                            series: <CircularSeries>[
                          PieSeries<RestaurantState, String>(
                              dataSource: restaurantData,
                              xValueMapper: (RestaurantState data, _) =>
                                  data.name,
                              // checked된 거 갯수 data.id에 넣기
                              yValueMapper: (RestaurantState data, _) =>
                                  data.portion,
                              dataLabelMapper: (RestaurantState data, _) =>
                                  data.name,

                              // Corner style of doughnut segment
                              // cornerStyle: CornerStyle.bothCurve,
                              dataLabelSettings: DataLabelSettings(
                                  // labelPosition: ChartDataLabelPosition.outside,
                                  isVisible: true,
                                  // Renders background rectangle and fills it with series color
                                  useSeriesColor: true)),
                        ]))),
              );
            }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _circleBloc.add(CircleEvent.btn_rotate);
          },
        ));
  }
}

class CircularParticleScreen extends StatelessWidget {
  const CircularParticleScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        child: Center(
          child: CircularParticle(
            key: UniqueKey(),
            awayRadius: 80,
            numberOfParticles: 200,
            speedOfParticles: 1,
            height: screenHeight,
            width: screenWidth,
            onTapAnimation: true,
            particleColor: Colors.white.withAlpha(150),
            awayAnimationDuration: Duration(milliseconds: 600),
            maxParticleSize: 8,
            isRandSize: true,
            isRandomColor: true,
            randColorList: [
              Colors.red.withAlpha(210),
              Colors.white.withAlpha(210),
              Colors.yellow.withAlpha(210),
              Colors.green.withAlpha(210)
            ],
            awayAnimationCurve: Curves.easeInOutBack,
            enableHover: true,
            hoverColor: Colors.white,
            hoverRadius: 90,
            connectDots: false, //not recommended
          ),
        ),
      ),
    );
  }
}
