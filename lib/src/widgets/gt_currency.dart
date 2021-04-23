import 'package:flutter/material.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

class GtCurrency extends StatelessWidget {
  GtCurrency(
      {this.amount,
      this.label,
      this.currency,
      this.labelTextStyle,
      this.amountTextStyle,
      this.horizontalView = false});

  final String amount;
  final String currency;
  final String label;
  final TextStyle labelTextStyle;
  final TextStyle amountTextStyle;
  final bool horizontalView;

  @override
  Widget build(BuildContext context) {
    var number = amount.split('.');
    return Container(
      padding: EdgeInsets.all(2.0),
      child: horizontalView
          ? Column(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (label != null)
                  GtText(
                    text: label,
                    textStyle: labelTextStyle ?? TextStyle(fontSize: 20),
                  ),
                Row(children: [
                  GtText(
                    text: currency != null
                        ? '$currency${number[0]}'
                        : '${number[0]}',
                    textStyle: amountTextStyle ??
                        TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (number.length > 1)
                    GtText(
                      text: '.${number[1]}',
                      textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ]),
              ],
            )
          : Row(
              children: [
                if (label != null)
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: GtText(
                      text: label,
                      textStyle: labelTextStyle ?? TextStyle(fontSize: 20),
                    ),
                  ),
                Row(children: [
                  GtText(
                    text: currency != null
                        ? '$currency${number[0]}'
                        : '${number[0]}',
                    textStyle: amountTextStyle ??
                        TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (number.length > 1)
                    GtText(
                      text: '.${number[1]}',
                      textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ]),
              ],
            ),
    );
  }
}
