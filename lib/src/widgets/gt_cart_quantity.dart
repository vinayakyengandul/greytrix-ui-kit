import 'package:flutter/material.dart';

class GtCartQuantity extends StatelessWidget {
  GtCartQuantity(
      {this.iconColor,
      this.initialValue = 1,
      this.incrementHandler,
      this.decrementHandler});

  final int initialValue;
  final Color iconColor;
  final Function incrementHandler;
  final Function decrementHandler;
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                color: iconColor ?? Theme.of(context).iconTheme.color,
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () =>
                    {if (decrementHandler != null) decrementHandler},
              ),
              Text(
                '$initialValue',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: () =>
                    {if (incrementHandler != null) incrementHandler},
              ),
            ],
          ),
        );
  }
}
