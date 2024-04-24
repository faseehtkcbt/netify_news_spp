import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  Pattern? filterPattern;
  final AutovalidateMode autovalidateMode;
  AppTextFormField(
      {super.key,
      required this.controller,
      this.textInputType = TextInputType.text,
      this.textCapitalization = TextCapitalization.none,
      this.validator,
      this.onChanged,
      this.autovalidateMode = AutovalidateMode.disabled,
      this.filterPattern});

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(),
      keyboardType: widget.textInputType,
      textCapitalization: widget.textCapitalization,
      validator: widget.validator,
      onChanged: widget.onChanged,
      autovalidateMode: widget.autovalidateMode,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          widget.filterPattern ?? RegExp(r"""
[a-zA-Z0-9\s!#$%&\'()*+,\-./:;<=>?@[\\\]^_`{|}~]"""),
        ),
      ],
    );
  }
}
