import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/core/utils/app_text_form_field.dart';

class CountrySelect extends StatefulWidget {
  const CountrySelect({super.key});

  @override
  State<CountrySelect> createState() => _CountrySelectState();
}

class _CountrySelectState extends State<CountrySelect> {
  final countryContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText(
          text: 'Select the country',
          textStyle: Theme.of(context).textTheme.titleMedium,
          textSize: 20,
        ),
      ),
      body: SafeArea(
          child: Container(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              AppTextFormField(
                controller: countryContoller,
                hintText: 'Search your country',
                filterPattern: RegExp(r"""[a-zA-Z]"""),
                textInputType: TextInputType.text,
                suffixIcon: const Icon(Icons.search_rounded),
              )
            ],
          ),
        ),
      )),
    );
  }
}
