import 'package:flutter/material.dart';

class ShowCalculatedIntake extends StatefulWidget {
  const ShowCalculatedIntake({required this.waterIntake, super.key});

  final String? waterIntake;

  @override
  State<ShowCalculatedIntake> createState() => _ShowCalculatedIntakeState();
}

class _ShowCalculatedIntakeState extends State<ShowCalculatedIntake> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("${widget.waterIntake}"),
              FloatingActionButton.extended(onPressed: () {}, label: Text("START"),)
            ],
          ),
        ),
      ),
    );
  }
}
