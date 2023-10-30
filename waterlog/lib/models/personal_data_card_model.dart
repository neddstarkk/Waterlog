// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum EntryFieldType {
  SELECT, TEXT, TIMEPICKER,
}

class PersonalDataCardModel {

  final Icon? icon;
  final EntryFieldType type;
  String title = '';
  dynamic value = '';

  PersonalDataCardModel({this.icon, required this.type, required this.title, required this.value});
}