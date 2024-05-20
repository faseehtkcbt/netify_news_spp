import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/bloc/selection_cubit/selection_cubit.dart';
import 'package:news_app/core/color_pallette/app_pallette.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/features/home/presentation/widgets/get_latest_news_widget.dart';

import '../../../../core/utils/app_text.dart';
import '../bloc/latest/news_bloc.dart';

class Latests extends StatefulWidget {
  const Latests({super.key});

  @override
  State<Latests> createState() => _LatestsState();
}

class _LatestsState extends State<Latests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: 'Latest',
          textStyle: Theme.of(context).textTheme.titleMedium,
          textSize: 20,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 55,
              width: double.infinity,
              child: BlocProvider<SelectionCubit>(
                create: (context) => SelectionCubit(),
                child: BlocConsumer<SelectionCubit, SelectionState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is SelectionInitial) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            context.read<SelectionCubit>().onSelection(index);
                            context.read<NewsBloc>().add(GetLatest(
                                Constants.categories[index] == 'All'
                                    ? "general"
                                    : Constants.categories[index]));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: state.index == index
                                    ? AppPellete.themeColor
                                    : null,
                                border: const Border(
                                    bottom: BorderSide(
                                        color: AppPellete.themeColor,
                                        width: 2))),
                            child: AppText(
                              text: Constants.categories[index],
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              textSize: 13,
                              textColor: state.index == index
                                  ? AppPellete.textWhiteColor
                                  : null,
                            ),
                          ),
                        ),
                        itemCount: Constants.categories.length,
                        shrinkWrap: true,
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
            const GetLatestNewsWidget(),
          ],
        )),
      ),
    );
  }
}
