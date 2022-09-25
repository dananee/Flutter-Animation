import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool play = false;
  final Duration duration = Duration(seconds: 2);
  // late AnimationController _controller;
  double leftPosition = 150;
  double lengthload = 0;
  @override
  void initState() {
    // _controller = AnimationController(vsync: this, duration: duration);
    // _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: () {
                setState(() {
                  leftPosition = leftPosition <= 150 ? 220.0 : 150.0;
                  lengthload = lengthload <= 0 ? 150.0 : 0;
                });
              })
        ]),
        backgroundColor: const Color.fromARGB(255, 124, 47, 47),
        body: Center(
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedPositioned(
                left: leftPosition,
                top: screenHeight / 2 - 70,
                curve: Curves.linear,
                duration: duration,
                child: Container(
                  child: Image.asset(
                    'assets/delivery.png',
                    width: 80.0,
                    height: 80.0,
                  ),
                ),
              ),
              // const SizedBox(height: 12),
              Positioned(
                top: screenHeight / 2,
                left: 150,
                child: AnimatedSize(
                    duration: Duration(milliseconds: 2000),
                    curve: Curves.linear,
                    child: Container(
                      height: 8.0,
                      width: lengthload,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                    )),
              ),
            ],
          ),
        ));
  }
}
