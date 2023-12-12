
// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Genders { MALE, FEMALE }

class UserProvider with ChangeNotifier {
  Genders? gender;
  String weight;
  String height;
  String wakeUpTime;
  String? requiredWaterIntake;

  UserProvider({
    this.gender = Genders.MALE,
    this.weight = 'kg',
    this.height = 'cm',
    this.wakeUpTime = 'AM',
  });

  void updateGender(Genders gender) {
    this.gender = gender;
    if (kDebugMode) {
      print("Updated gender");
    }
    notifyListeners();
  }

  void updateWeight(String weight) {
    this.weight = weight;
    if (kDebugMode) {
      print("Updated Weight");
    }
    notifyListeners();
  }

  void updateHeight(String height) {
    this.height = height;
    if (kDebugMode) {
      print("Updated height");
    }
    notifyListeners();
  }

  void updateWakeUpTime(String time) {
    wakeUpTime = time;
    if (kDebugMode) {
      print("Updated Wake up time");
    }
    notifyListeners();
  }
  void updateRequiredWaterIntake(String? intake) {
    requiredWaterIntake = intake;
    if(kDebugMode) {
      print("Updated Water Intake");
    }
    notifyListeners();
  }

  String? get waterIntake => requiredWaterIntake;

  Genders? get fetchGender => gender;

  String get fetchWeight => weight;

  String get fetchHeight => height;

  String get fetchTime => wakeUpTime;
}
