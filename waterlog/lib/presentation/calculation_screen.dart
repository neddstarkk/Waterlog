import 'package:flutter/material.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({super.key});

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  bool isCalculating = false;

  @override
  void initState() {
    super.initState();
    isCalculating = true;
  }

  @override
  Widget build(BuildContext context) {
    if(isCalculating = true) {
      return const Scaffold(body: Center(child: CircularProgressIndicator(),),);
    }
    else {
      return const Scaffold();
    }

  }
}
