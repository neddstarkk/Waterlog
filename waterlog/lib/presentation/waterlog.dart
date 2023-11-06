import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waterlog/presentation/calculation_screen.dart';
import 'package:waterlog/presentation/widgets/list_view_builder.dart';
import 'package:waterlog/services/user_provider.dart';

class Waterlog extends StatelessWidget {
  const Waterlog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<UserProvider>(
        create: (_) => UserProvider(),
        child: const Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Spacer(),
                  Card(
                    color: Color(0xff9498EF),
                    elevation: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 10.0),
                      child: Text("Personal Data",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                  PersonalDetailsEntry(),
                  NextButton(),
                  // Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: FloatingActionButton.extended(
          onPressed: () {
            // commented for easier development
            // var provider = Provider.of<UserProvider>(context, listen: false);
            // if (provider.fetchWeight.length < 4) {
            //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //       behavior: SnackBarBehavior.floating,
            //       content: Text("Error: Weight needs to be a valid value")));
            // } else if (provider.fetchHeight.length < 5) {
            //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //       behavior: SnackBarBehavior.floating,
            //       content: Text("Error: Height cannot be empty")));
            // } else if (provider.fetchTime.length < 3) {
            //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //       behavior: SnackBarBehavior.floating,
            //       content: Text("Error: Please provide a valid wake-up time")));
            // } else {
            //   Navigator.push(context, CupertinoPageRoute(builder: (context) => const CalculationScreen()));
            // }
            Navigator.push(context, CupertinoPageRoute(builder: (context) => const CalculationScreen()));
          },
          label: const Text("NEXT")),
    );
  }
}
