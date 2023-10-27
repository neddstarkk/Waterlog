import 'package:flutter/material.dart';

class Waterlog extends StatelessWidget {
  const Waterlog({super.key});

  @override
  Widget build(BuildContext context) {
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
                      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                      child: Text("Personal Data", style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                const SizedBox(height: 100,),
                ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index)  {
                    return const ListTile(
                      trailing: Text("Male"),
                      title: Text("Gender"),
                      leading: Icon(Icons.transgender),
                    );
                  },
                  shrinkWrap: true,
                ),
                // Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
