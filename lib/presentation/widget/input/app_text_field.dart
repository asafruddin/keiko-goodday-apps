import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {Key? key,
      this.labelText,
      this.controller,
      this.hintText,
      this.securableText = false})
      : super(key: key);

  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final bool? securableText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final securePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(8));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(widget.labelText ?? '')),
        ValueListenableBuilder<bool>(
            valueListenable: securePassword,
            builder: (context, value, child) {
              return TextFormField(
                controller: widget.controller,
                obscureText: securePassword.value,
                decoration: InputDecoration(
                    border: border,
                    hintText: widget.hintText,
                    enabledBorder: border,
                    suffixIcon: widget.securableText!
                        ? IconButton(
                            onPressed: () =>
                                securePassword.value = !securePassword.value,
                            icon: getEyeIcon())
                        : null,
                    disabledBorder: border.copyWith(
                        borderSide:
                            BorderSide(color: Theme.of(context).disabledColor)),
                    focusedBorder: border.copyWith(
                        borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1.5,
                    ))),
              );
            }),
      ],
    );
  }

  Widget getEyeIcon() => ValueListenableBuilder<bool>(
      valueListenable: securePassword,
      builder: (context, value, child) {
        if (value) {
          return const Icon(Icons.visibility);
        }
        return const Icon(Icons.visibility_off);
      });
}
