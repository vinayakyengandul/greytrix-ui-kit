import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GtBarChart extends StatelessWidget {
  GtBarChart(
      {this.data,
      this.seriesId,
      this.animate = false,
      this.chartbehaviours,
      this.series});

  final List<dynamic> data;
  final String seriesId;
  final bool animate;
  final List<charts.ChartBehavior> chartbehaviours;
  final List<charts.Series<dynamic, String>> series;

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      series,
      animate: animate,
      behaviors: chartbehaviours,
    );
  }
}
