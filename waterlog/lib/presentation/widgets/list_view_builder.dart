// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../models/personal_data_card_model.dart';
import 'radio_option.dart';
import 'text_option.dart';

enum Genders { MALE, FEMALE }

class PersonalDetailsEntry extends StatefulWidget {
  const PersonalDetailsEntry({super.key});

  @override
  State<PersonalDetailsEntry> createState() => _PersonalDetailsEntryState();
}

class _PersonalDetailsEntryState extends State<PersonalDetailsEntry> {
  List<PersonalDataCardModel> items = [];
  Genders? gender = Genders.MALE;
  String weight = '';

  void onGenderChanged(Genders? gender) {
    setState(() {
      this.gender = gender;
    });
  }

  void onWeightChanged(String age) {
    setState(() {
      this.weight = age;
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
          value: weight),
    ];
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return ListTile(
            trailing: Text(items[index].value.toString()),
            title: Text(items[index].title.toString()),
            leading: items[index].icon,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    if (items[index].type == EntryFieldType.SELECT) {
                      return RadioOption(
                        title: items[index].title,
                        onGenderChanged: onGenderChanged,
                        gender: gender,
                      );
                    }
                    return TextOption(
                      title: items[index].title,
                      operation: onWeightChanged,
                      prevVal: weight,
                    );
                  });
            });
      },
      shrinkWrap: true,
    );
  }
}

