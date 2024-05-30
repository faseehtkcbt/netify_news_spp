import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/source_list_tile.dart';
import 'package:news_app/features/explore/presentation/bloc/source_bloc.dart';

import '../../../../core/utils/app_text.dart';
import '../../../../core/utils/loader.dart';

class SourceDetailsList extends StatefulWidget {
  const SourceDetailsList({super.key});

  @override
  State<SourceDetailsList> createState() => _SourceDetailsListState();
}

class _SourceDetailsListState extends State<SourceDetailsList> {
  @override
  void initState() {
    context.read<SourceBloc>().add(GetSources());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SourceBloc, SourceState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SourceFailure) {
          return Center(
              child: AppText(
                  text: 'ERROR',
                  textStyle: Theme.of(context).textTheme.bodyMedium));
        } else if (state is SourceLoaded) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.data.length,
              itemBuilder: (context, index) =>
                  SourceListTile(data: state.data[index]));
        } else {
          return const Center(
            child: Loader(),
          );
        }
      },
    );
  }
}
