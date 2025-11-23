import 'package:flutter/material.dart';
import 'dart:math' as math;

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with TickerProviderStateMixin {
    late final AnimationController _controller = AnimationController(duration: const Duration(seconds: 3), vsync: this)..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            AnimatedBuilder(animation: _controller ,
            child: Container(
              height: 200,
              width: 200,
              child: const Center(
                child: Image(image: AssetImage("assets/images/virus.png")),
              ),
            ),
             builder: (BuildContext context, Widget? child){
              return Transform.rotate(angle: _controller.value * 2.0 * math.pi, 
              child: child,);
            })
          ],
        ),
      ),
    );
  }
}
