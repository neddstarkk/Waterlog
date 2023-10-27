import 'package:flutter/material.dart';
import 'package:waterlog/presentation/widgets/list_view_builder.dart';

import '../models/personal_data_card_model.dart';

class Waterlog extends StatelessWidget {
  const Waterlog({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PersonalDataCardModel> items = [
      PersonalDataCardModel(
          icon: const Icon(Icons.transgender), title: "gender", value: "Male"),
      PersonalDataCardModel(
          icon: const Icon(Icons.person), title: "age", value: "25"),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Spacer(),
                const Card(
                  color: Color(0xff9498EF),
                  elevation: 0,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                    child: Text("Personal Data",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                buildListView(items),
                // Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
