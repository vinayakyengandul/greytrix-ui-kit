import 'package:flutter/cupertino.dart';

class GtAdvanceFilterField {
  GtAdvanceFilterField({
    @required this.label,
    @required this.value,
    this.type = GtAdvanceFilterFieldOperatorType.STRING,
    this.options,
    this.isNastedFilter = false,
  });
  final String label;
  final String value;
  final GtAdvanceFilterFieldOperatorType type;
  final List<Map<String,dynamic>> options;
  final bool isNastedFilter;
}

class GtAdvanceFilterOperator {
  GtAdvanceFilterOperator({
    @required this.label,
    @required this.value,
    this.type = GtAdvanceFilterOperatorType.COMMON,
  });
  final String label;
  final String value;
  final GtAdvanceFilterOperatorType type;

  factory GtAdvanceFilterOperator.fromJson(Map<String, dynamic> json) {
    return GtAdvanceFilterOperator(
      label: json["label"],
      value: json["value"],
      type: json["type"] as GtAdvanceFilterOperatorType,
    );
  }
}

enum GtAdvanceFilterFieldOperatorType {STRING, NUMERIC, SELECT}
enum GtAdvanceFilterOperatorType {COMMON, STRING, NUMERIC}