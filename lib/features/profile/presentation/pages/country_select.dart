import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/color_pallette/app_pallette.dart';
import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/core/utils/app_text_form_field.dart';
import 'package:news_app/core/utils/loader.dart';
import 'package:news_app/core/utils/network_image.dart';
import 'package:news_app/features/profile/domain/entity/country_entity.dart';
import 'package:news_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:news_app/features/profile/presentation/cubit/search_country_cubit.dart';

import '../../../../core/bloc/selection_cubit/selection_cubit.dart';

class CountrySelect extends StatefulWidget {
  const CountrySelect({super.key});

  @override
  State<CountrySelect> createState() => _CountrySelectState();
}

class _CountrySelectState extends State<CountrySelect> {
  final countryController = TextEditingController();
  String selectedCountry = '';
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileBloc>().add(Getcountries());
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
            onPressed: () {},
            child: AppText(
              text: 'Next',
              textStyle: Theme.of(context).textTheme.bodyMedium,
              fontWeight: FontWeight.w600,
              textColor: AppPellete.textWhiteColor,
            )),
      ),
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
        padding: const EdgeInsets.all(15.0),
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is ProfileLoaded<List<CountryEntity>>) {
                context
                    .read<SearchCountryCubit>()
                    .searchCountries(state.data, "");
                return Column(
                  children: [
                    AppTextFormField(
                      controller: countryController,
                      onChanged: (value) {
                        context
                            .read<SearchCountryCubit>()
                            .searchCountries(state.data, value ?? "");
                      },
                      hintText: 'Search your country',
                      filterPattern: RegExp(r"""[a-zA-Z]"""),
                      textInputType: TextInputType.text,
                      suffixIcon: const Icon(Icons.search_rounded),
                    ),
                    BlocConsumer<SearchCountryCubit, SearchCountryState>(
                      listener: (context, searchState) {
                        // TODO: implement listener
                      },
                      builder: (context, searchState) {
                        if (searchState is SearchCountryLoaded) {
                          return BlocProvider(
                            create: (context) => SelectionCubit(),
                            child: BlocBuilder<SelectionCubit, SelectionState>(
                              builder: (context, selectedState) {
                                return selectedState is SelectionInitial
                                    ? ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            onTap: () {
                                              context
                                                  .read<SelectionCubit>()
                                                  .onSelection(index);
                                              selectedCountry = searchState
                                                      .data[index]
                                                      .countryCode ??
                                                  '';
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            tileColor:
                                                selectedState.index == index
                                                    ? AppPellete.themeColor
                                                    : null,
                                            leading: NetworkImageUrl(
                                                url: searchState
                                                        .data[index].flagUrl ??
                                                    '',
                                                height: 20,
                                                width: 30),
                                            title: AppText(
                                              text: searchState.data[index]
                                                      .countryName ??
                                                  '',
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              height: 10,
                                            ),
                                        itemCount: searchState.data.length)
                                    : const SizedBox();
                              },
                            ),
                          );
                        } else {
                          return const Center(
                            child: Loader(),
                          );
                        }
                      },
                    ),
                  ],
                );
              } else if (state is ProfileError) {
                return Center(
                  child: AppText(
                      text: state.failure.message,
                      textStyle: Theme.of(context).textTheme.bodyMedium),
                );
              } else {
                return const Center(
                  child: Loader(),
                );
              }
            },
          ),
        ),
      )),
    );
  }
}
