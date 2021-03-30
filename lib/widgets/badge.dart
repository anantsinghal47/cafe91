import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key key,
    @required this.child,
    @required this.value,
    this.color,
  }) : super(key: key);

  final Widget child;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
          Positioned(
            left: 8,
            bottom: 10,
            child: value != '0' ? Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 8,
                color: Colors.black54,
                fontWeight: FontWeight.bold
              ),
            ):Container(),
          )
        ],
      ),
    );
  }
}
