// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../models/personal_data_card_model.dart';

enum Genders { MALE, FEMALE }

class PersonalDetailsEntry extends StatefulWidget {
  const PersonalDetailsEntry({super.key});

  @override
  State<PersonalDetailsEntry> createState() => _PersonalDetailsEntryState();
}

class _PersonalDetailsEntryState extends State<PersonalDetailsEntry> {
  List<PersonalDataCardModel> items = [];
  Genders? gender = Genders.MALE;

  Widget TextOption() {
    return Text("Text Field");
  }

  void onGenderChanged(Genders? gender) {
    setState(() {
      this.gender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    items = [
      PersonalDataCardModel(
          icon: const Icon(Icons.transgender),
          type: EntryFieldType.SELECT,
          title: "gender",
          value: gender == Genders.MALE ? "Male" : "Female"),
      PersonalDataCardModel(
          icon: const Icon(Icons.person),
          type: EntryFieldType.TEXT,
          title: "age",
          value: "25"),
    ];
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return ListTile(
            trailing: Text(items[index].value.toString()),
            title: Text(items[index].title.toString()),
            leading: items[index].icon,
            onTap: () {
              showDialog(context: context, builder: (context) => RadioOption(title: items[index].title, onGenderChanged: onGenderChanged, gender: gender,));
            });
      },
      shrinkWrap: true,
    );
  }
}

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
