import 'package:flutter/material.dart';

import 'list_view_builder.dart';

// ignore: must_be_immutable
class RadioOption extends StatefulWidget {
  final String title;
  final Function(Genders? gender) onGenderChanged;
  Genders? gender;

  RadioOption({super.key, required this.title, required this.onGenderChanged, this.gender});

  @override
  State<RadioOption> createState() => _RadioOptionState();
}

class _RadioOptionState extends State<RadioOption> {
  Genders? gender;

  @override
  void initState() {
    super.initState();
    gender = widget.gender;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile(
            value: Genders.MALE,
            title: const Text("Male"),
            groupValue: gender,
            onChanged: (Genders? value) {
              setState(() {
                gender = value;
              });
              widget.onGenderChanged(value);
            },
          ),
          RadioListTile(
            value: Genders.FEMALE,
            title: const Text("Female"),
            groupValue: gender,
            onChanged: (Genders? value) {
              setState(() {
                gender = value;
              });
              widget.onGenderChanged(value);
            },
          ),
        ],
      ),
    );
  }
}
