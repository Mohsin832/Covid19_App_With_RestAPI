import 'dart:async';
import 'dart:math' as math;
import 'package:covidapp/constants/widget.dart';
import 'package:covidapp/view/screens/world_state.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 4),
  )..repeat();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WorldState()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: _controller.value * 2.0 * math.pi,
                child: child,
              );
            },
            child: SizedBox(
              height: 200,
              width: 200,
              child: const Center(
                child: Image(image: AssetImage("assets/images/virus.png")),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Align(
            alignment: Alignment.center,
            child: Uihelper.customFont(
              text: "Covid-19 \nTracker app",
              fontsize: 33,
              fontweight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
