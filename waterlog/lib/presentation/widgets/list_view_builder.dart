// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/personal_data_card_model.dart';
import '../../services/user_provider.dart';
import 'radio_option.dart';
import 'text_option.dart';



class PersonalDetailsEntry extends StatefulWidget {
  const PersonalDetailsEntry({super.key});

  @override
  State<PersonalDetailsEntry> createState() => _PersonalDetailsEntryState();
}

class _PersonalDetailsEntryState extends State<PersonalDetailsEntry> {
  List<PersonalDataCardModel> items = [];
  Genders? gender = Genders.MALE;
  String weight = 'kg';
  String height = 'cm';
  String time = 'AM';

  void onGenderChanged(Genders? gender) {
    setState(() {
      this.gender = gender;
    });
    Provider.of<UserProvider>(context, listen: false).updateGender(gender!);
  }

  void onWeightChanged(String weight) {
    setState(() {
      this.weight = weight;
    });
    Provider.of<UserProvider>(context, listen: false).updateWeight(weight);
  }

  void onHeightChanged(String height) {
    setState(() {
      this.height = height;
    });
    Provider.of<UserProvider>(context, listen: false).updateHeight(height);
  }

  @override
  Widget build(BuildContext context) {
    items = [
      PersonalDataCardModel(
        type: EntryFieldType.SELECT,
        title: "Gender",
        value: gender == Genders.MALE ? "Male" : "Female",
        icon: const Icon(Icons.transgender),
      ),
      PersonalDataCardModel(
        type: EntryFieldType.TEXT,
        title: "Weight",
        value: weight,
        icon: const Icon(Icons.person),
      ),
      PersonalDataCardModel(
        type: EntryFieldType.TEXT,
        title: "Height",
        value: height,
        icon: const Icon(Icons.height),
      ),
      PersonalDataCardModel(
        type: EntryFieldType.TIMEPICKER,
        title: "Wake-up Time",
        value: time,
        icon: const Icon(Icons.alarm),
      ),
    ];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
            trailing: Text(items[index].value.toString()),
            title: Text(items[index].title.toString()),
            leading: items[index].icon,
            onTap: () async {
              if (items[index].type == EntryFieldType.TIMEPICKER) {
                final selectedTime = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());
                if (!context.mounted) return;

                if (kDebugMode) {
                  print(selectedTime?.format(context));
                }

                setState(() {
                  time = selectedTime!.format(context);
                });

                Provider.of<UserProvider>(context,listen: false).updateWakeUpTime(time);
              } else {
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
                        operation: index == 1 ? onWeightChanged : onHeightChanged,
                        prevVal: index == 1 ? weight : height,
                        unit: index == 1 ? "kg" : "cm",
                      );
                    });
              }
            });
      },
      shrinkWrap: true,
    );
  }
}