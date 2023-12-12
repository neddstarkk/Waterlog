import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/user_provider.dart';

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
          child: Text("${widget.waterIntake}"),
          ),
        ),
    );
  }
}
