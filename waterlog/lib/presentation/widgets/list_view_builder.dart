import 'package:flutter/material.dart';

import '../../models/personal_data_card_model.dart';


ListView buildListView(List<PersonalDataCardModel> items) {
  return ListView.builder(
    itemCount: 2,
    itemBuilder: (context, index) {
      return ListTile(
        trailing: Text(items[index].value.toString()),
        title: Text(items[index].title.toString()),
        leading: items[index].icon,
        onTap: () {
          AlertDialog alert = AlertDialog(
            title: Text("Alert Title"),
            content: Text("Alert Content"),
            actions: [
              TextButton(onPressed: () {}, child: Text("cancel"))
            ],
          );
          showDialog(
            context: context,
            builder: (context) {
              return alert;
            },
          );
        },
      );
    },
    shrinkWrap: true,
  );
}