// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextOption extends StatefulWidget {
  final String title;
  final Function(String val) operation;
  final String prevVal;

  const TextOption(
      {super.key,
        required this.title,
        required this.operation,
        required this.prevVal});

  @override
  State<TextOption> createState() => _TextOptionState();
}

class _TextOptionState extends State<TextOption> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "Enter the value"
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              widget.operation(_controller.text);
              Navigator.pop(context);
            },
            child: const Text("Confirm"))
      ],
    );
  }
}
