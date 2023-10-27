import 'package:flutter/material.dart';

class PersonalDataCardModel {
  
  final Icon? icon;
  String title = '';
  String value = '';

  PersonalDataCardModel({this.icon, required this.title, required this.value});
}