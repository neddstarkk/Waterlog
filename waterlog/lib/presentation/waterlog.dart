import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  const PersonalDetailsEntry(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: FloatingActionButton.extended(onPressed: () {}, label: const Text("NEXT")),
                  )
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
