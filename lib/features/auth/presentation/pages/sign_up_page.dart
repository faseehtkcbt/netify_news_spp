import 'package:flutter/material.dart';
import 'package:news_app/core/color_pallette/app_pallette.dart';
import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/core/utils/app_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'Hello!',
              textStyle: Theme.of(context).textTheme.titleMedium,
              textSize: 40,
              textColor: AppPellete.themeColor,
            ),
            AppText(
              text: 'SignUp to get Started',
              textStyle: Theme.of(context).textTheme.bodyMedium,
              textSize: 18,
            ),
            AppTextFormField(controller: TextEditingController())
          ],
        ),
      )),
    );
  }
}
