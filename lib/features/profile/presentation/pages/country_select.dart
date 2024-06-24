import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/color_pallette/app_pallette.dart';
import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/core/utils/app_text_form_field.dart';
import 'package:news_app/core/utils/loader.dart';
import 'package:news_app/core/utils/network_image.dart';
import 'package:news_app/core/utils/snackbar.dart';
import 'package:news_app/features/profile/domain/entity/country_entity.dart';
import 'package:news_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:news_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:news_app/features/profile/presentation/cubit/search_country_cubit.dart';

import '../../../../config/route/routes.dart';
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
    return PopScope(
      canPop: false,
      onPopInvoked: (pop) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.homeScreen, (listen) => false);
      },
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
              onPressed: () {
                if (selectedCountry != '') {
                  context
                      .read<ProfileLocalCubit>()
                      .storeCountry(selectedCountry);
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.homeScreen, (listen) => false);
                } else {
                  showAppSnackBar(context, 'Please select a country');
                }
              },
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
            child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is ProfileLoaded<List<CountryEntity>>) {
              context
                  .read<SearchCountryCubit>()
                  .searchCountries(state.data, countryController.text);
              return Container(
                padding: const EdgeInsets.all(15.0),
                height: size.height,
                width: size.width,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      AppTextFormField(
                        controller: countryController,
                        onChanged: (value) {
                          context
                              .read<SearchCountryCubit>()
                              .searchCountries(state.data, value);
                        },
                        hintText: 'Search your country',
                        filterPattern: RegExp(r"""[a-z  A-Z]"""),
                        textInputType: TextInputType.text,
                        suffixIcon: const Icon(Icons.search_rounded),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocConsumer<SearchCountryCubit, SearchCountryState>(
                        listener: (context, searchState) {
                          // TODO: implement listener
                        },
                        builder: (context, searchState) {
                          if (searchState is SearchCountryLoaded) {
                            return searchState.data.isNotEmpty
                                ? BlocProvider(
                                    create: (context) => SelectionCubit(),
                                    child: BlocBuilder<SelectionCubit,
                                        SelectionState>(
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
                                                          .read<
                                                              SelectionCubit>()
                                                          .onSelection(index);
                                                      selectedCountry =
                                                          searchState
                                                                  .data[index]
                                                                  .countryCode ??
                                                              '';
                                                    },
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                    tileColor: selectedState
                                                                .index ==
                                                            index
                                                        ? AppPellete.themeColor
                                                        : null,
                                                    leading: NetworkImageUrl(
                                                        url: searchState
                                                                .data[index]
                                                                .flagUrl ??
                                                            '',
                                                        height: 20,
                                                        width: 30),
                                                    title: AppText(
                                                      text: searchState
                                                              .data[index]
                                                              .countryName ??
                                                          '',
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium,
                                                    ),
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) =>
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                itemCount:
                                                    searchState.data.length)
                                            : const SizedBox();
                                      },
                                    ),
                                  )
                                : Center(
                                    child: AppText(
                                        text: 'Something went wrong',
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium));
                          } else {
                            return const Center(
                              child: Loader(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ProfileError) {
              showAppSnackBar(context, state.failure.message);
              return Center(
                child: AppText(
                    text: 'Something went wrong',
                    textStyle: Theme.of(context).textTheme.bodyMedium),
              );
            } else {
              return const Center(
                child: Loader(),
              );
            }
          },
        )),
      ),
    );
  }
}
