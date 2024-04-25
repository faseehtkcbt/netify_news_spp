import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool isObscure;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final String hintText;
  final Widget? suffixIcon;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  Pattern? filterPattern;
  final AutovalidateMode autovalidateMode;
  AppTextFormField(
      {super.key,
      required this.controller,
      this.suffixIcon,
      required this.hintText,
      this.textInputType = TextInputType.text,
      this.textCapitalization = TextCapitalization.none,
      this.validator,
      this.onChanged,
      this.autovalidateMode = AutovalidateMode.disabled,
      this.filterPattern,
      this.isObscure = false});

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isObscure,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
      decoration: InputDecoration(
          hintText: widget.hintText, suffixIcon: widget.suffixIcon),
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