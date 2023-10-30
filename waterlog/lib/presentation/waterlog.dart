import 'package:flutter/material.dart';
import 'package:waterlog/presentation/widgets/list_view_builder.dart';

import 'widgets/radio_option.dart';

class Waterlog extends StatelessWidget {
  const Waterlog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/radio-option': (context) => RadioOption(onGenderChanged: (val) {}, title: '',),
      },
      home: const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Spacer(),
                Card(
                  color: Color(0xff9498EF),
                  elevation: 0,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                    child: Text("Personal Data",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                PersonalDetailsEntry()
                // Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
