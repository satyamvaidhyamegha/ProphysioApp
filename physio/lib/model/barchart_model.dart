import 'package:flutter/material.dart';

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final int y;
}

class DayData {
  DayData(this.x, this.y, this.color);
  final String x;
  final int y;
  final Color? color;
}

class TimeData {
  TimeData(this.x, this.y, this.color);
  final String x;
  final int y;
  final Color? color;
}
