import 'package:flutter/material.dart';

class Animated extends StatefulWidget {
  @override
  _AnimatedState createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> {
  Alignment _alignment = Alignment.center;
  double _animatedHeight = 200;
  double _animatedWidth = 400;
  double _iconHeight = 180;
  double _iconWidth = 180;
  Color _animatedColor = Colors.red;
  bool _isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(25),
        child: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _animatedWidth == 400
                    ? _isAnimated = true
                    : _isAnimated = false;
                _isAnimated
                    ? _alignment = Alignment.topCenter
                    : _alignment = Alignment.center;
                _isAnimated ? _animatedWidth = 200 : _animatedWidth = 400;
                _isAnimated
                    ? _animatedHeight = MediaQuery.of(context).size.height - 200
                    : _animatedHeight = 200;
                _isAnimated
                    ? _animatedColor = Colors.lightBlue
                    : _animatedColor = Colors.redAccent;
                _isAnimated ? _iconWidth = 100 : _iconWidth = 180;
                _isAnimated ? _iconHeight = 100 : _iconHeight = 180;
              });
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 3),
              width: _animatedWidth,
              height: _animatedHeight,
              curve: Curves.linearToEaseOut,
              alignment: _alignment,
              child: AnimatedContainer(
                duration: Duration(seconds: 3),
                width: _iconWidth,
                height: _iconHeight,
                curve: Curves.fastOutSlowIn,
                child: GestureDetector(
                  child: Image(
                    image: AssetImage(
                      'images/2.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
