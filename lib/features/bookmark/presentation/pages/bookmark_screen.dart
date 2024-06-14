import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_text.dart';
import '../bloc/bookmark_bloc.dart';
import '../widget/get_bookmark.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<BookmarkBloc>().add(GetBookmarkNews());
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: 'BookMark',
          textStyle: Theme.of(context).textTheme.titleMedium,
          textSize: 25,
        ),
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        child: const GetBookmark(),
      )),
    );
  }
}
