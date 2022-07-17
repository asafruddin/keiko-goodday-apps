import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({Key? key, this.labelText, this.controller, this.hintText})
      : super(key: key);

  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(8));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(labelText ?? '')),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              border: border,
              hintText: hintText,
              enabledBorder: border,
              disabledBorder: border.copyWith(
                  borderSide:
                      BorderSide(color: Theme.of(context).disabledColor)),
              focusedBorder: border.copyWith(
                  borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.5,
              ))),
        ),
      ],
    );
  }
}
