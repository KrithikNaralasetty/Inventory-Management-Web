import 'package:flutter/material.dart';
import 'package:inventory_management_web/Data/ColorData.dart' as cd;
import 'dart:math';
import 'package:inventory_management_web/Data/TablesData.dart' as data;

class TaskPieChartWidget extends StatefulWidget {
  TaskPieChartWidget({Key key}) : super(key: key);
  _TaskPieChartWidgetState createState() => new _TaskPieChartWidgetState();
}

class _TaskPieChartWidgetState extends State<TaskPieChartWidget> {
  Widget PieChartView() {
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: -10,
              blurRadius: 10,
              offset: Offset(-5, -5),
              color: cd.primary,
            ),
            BoxShadow(
              spreadRadius: -7,
              blurRadius: 10,
              offset: Offset(7, 7),
              color: Colors.black.withOpacity(0.5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: constraint.maxWidth * 0.4,
                child: CustomPaint(
                  child: Center(),
                  foregroundPainter: PieChart(width: constraint.maxWidth * 0.5),
                ),
              ),
            ),
            Center(
              child: Container(
                height: constraint.maxHeight * 0.4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      offset: Offset(-1, -1),
                      color: Colors.white,
                    ),
                    BoxShadow(
                      spreadRadius: -3,
                      blurRadius: 10,
                      offset: Offset(5, 5),
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(data.records.length.toString(),style: cd.textSt,),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Title of The Pie Chart
        Expanded(
          child: Text(
            "Statistic of Pending Tasks",
            style: cd.textSt,
          ),
        ),
        //Data in the Pie Chart
        Expanded(
            flex: 9,
            child: Row(
              children: [
                //Categories of Pie Chart
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      //Uncompleted Tasks
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Icon(
                                  Icons.circle,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 20,
                              child: Text(
                                "Critical Tasks to perform",
                                style: cd.textSt,
                              ),
                            )
                          ],
                        ),
                      ),
                      //Completed Tasks
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Icon(
                                  Icons.circle,
                                  color: Colors.greenAccent,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 20,
                              child: Text(
                                "Completed Tasks",
                                style: cd.textSt,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Painter of Pie Chart
                Expanded(
                  flex: 4,
                  child: PieChartView(),
                )
              ],
            )),
      ],
    );
  }
}

class PieChart extends CustomPainter {
  final List<data.TaskType> categories = data.pendingTasks;
  final double width;

  PieChart({@required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width / 2;

    double total = 0;
    categories.forEach((element) => total += element.count);

    double startRadian = (-pi) / 2;
    for (var i = 0; i < categories.length; i++) {
      var currentTaskType = categories.elementAt(i);
      var sweepRadian = currentTaskType.count / total * 2 * pi;
      paint.color = currentTaskType.color;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startRadian,
        sweepRadian,
        false,
        paint,
      );
      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
