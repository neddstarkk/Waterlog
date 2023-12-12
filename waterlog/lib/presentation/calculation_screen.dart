import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({super.key});

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  bool isCalculating = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      setState(() {
        isCalculating = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    if (isCalculating == true) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    } else {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText('Your Proper Water Intake is '),
              ],
              totalRepeatCount: 1,
            ),
          ),
        ),
      );
    }
  }
}
