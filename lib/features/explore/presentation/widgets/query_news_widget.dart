import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/app_text_form_field.dart';
import 'package:news_app/core/utils/snackbar.dart';
import 'package:news_app/features/explore/presentation/bloc/explore_bloc.dart';

import '../../../../core/utils/app_text.dart';
import '../../../../core/utils/loader.dart';
import '../../../../core/utils/news_list_tile.dart';

class QueryNewsWidget extends StatefulWidget {
  const QueryNewsWidget({super.key});

  @override
  State<QueryNewsWidget> createState() => _QueryNewsWidgetState();
}

class _QueryNewsWidgetState extends State<QueryNewsWidget> {
  final searchController = TextEditingController();
  @override
  void initState() {
    context.read<ExploreBloc>().add(QueryNews("general"));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppTextFormField(
                controller: searchController,
                hintText: 'Type to explore news',
                onFieldSubmitted: (value) {
                  context
                      .read<ExploreBloc>()
                      .add(QueryNews(value != '' ? value : 'general'));
                },
              ),
            ),
            BlocConsumer<ExploreBloc, ExploreState>(
              builder: (BuildContext context, newsState) {
                if (newsState is ExploreFailure) {
                  showAppSnackBar(context, newsState.failures.message);
                  return Center(
                      child: AppText(
                          text: 'Something went wrong',
                          textStyle: Theme.of(context).textTheme.bodyMedium));
                } else if (newsState is ExploreLoaded) {
                  return newsState.data.isNotEmpty
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return NewsListTile(
                                newsEntity: newsState.data[index]);
                          },
                          shrinkWrap: true,
                          itemCount: newsState.data.length,
                        )
                      : Center(
                          child: AppText(
                              text: 'No updates on this subject',
                              textStyle:
                                  Theme.of(context).textTheme.bodyMedium));
                } else {
                  return const Center(
                    child: Loader(),
                  );
                }
              },
              listener: (BuildContext context, Object? state) {},
            ),
          ],
        ),
      ),
    );
  }
}
