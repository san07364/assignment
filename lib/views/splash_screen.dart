import 'package:flutter/material.dart';
import 'package:flutter_assignment/views/home_screen.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  SequenceAnimation sequenceAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: Duration(milliseconds: 0),
            to: Duration(milliseconds: 300),
            tag: "blue")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: Duration(milliseconds: 300),
            to: Duration(milliseconds: 600),
            tag: "orange")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: Duration(milliseconds: 600),
            to: Duration(milliseconds: 900),
            tag: "purple")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: Duration(milliseconds: 900),
            to: Duration(milliseconds: 1200),
            tag: "red")
        .animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    });
    return Container(
      color: Colors.white,
      child: Center(
        child: Container(
          color: Colors.white,
          height: 380,
          width: 380,
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: controller,
                builder: (BuildContext context, Widget child) {
                  double value = sequenceAnimation["blue"].value;
                  return Positioned(
                    bottom: 160 - value * 160,
                    left: 160 - value * 160,
                    child: Opacity(
                      opacity: value,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Image(
                          height: value * 280,
                          width: value * 280,
                          image: AssetImage("assets/blue.png"),
                        ),
                      ),
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: controller,
                builder: (BuildContext context, Widget child) {
                  double value = sequenceAnimation["orange"].value;
                  return Positioned(
                    top: 85 - value * 85,
                    left: 85 - value * 85,
                    child: Opacity(
                      opacity: value,
                      child: Padding(
                        padding: EdgeInsets.only(top: 60, left: 45),
                        child: Image(
                          height: value * 170,
                          width: value * 170,
                          image: AssetImage("assets/orange.png"),
                        ),
                      ),
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: controller,
                builder: (BuildContext context, Widget child) {
                  double value = sequenceAnimation["purple"].value;
                  return Positioned(
                    bottom: 130 - value * 130,
                    right: 130 - value * 130,
                    child: Opacity(
                      opacity: value,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Image(
                          height: value * 260,
                          width: value * 260,
                          image: AssetImage("assets/purple.png"),
                        ),
                      ),
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: controller,
                builder: (BuildContext context, Widget child) {
                  double value = sequenceAnimation["red"].value;
                  return Positioned(
                    top: 125 - value * 125,
                    right: 125 - value * 125,
                    child: Opacity(
                      opacity: value,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, right: 30),
                        child: Image(
                          height: value * 250,
                          width: value * 250,
                          image: AssetImage("assets/red.png"),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                right: 20,
                top: 8,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Image(
                    height: 250,
                    width: 250,
                    image: AssetImage("assets/logo.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
