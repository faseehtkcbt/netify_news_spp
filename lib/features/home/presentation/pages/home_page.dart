import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/bloc/selection_cubit/selection_cubit.dart';
import 'package:news_app/features/explore/presentation/pages/explore_page.dart';
import 'package:news_app/features/home/presentation/pages/homescreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _pages = const [
    HomeScreen(),
    ExplorePage(),
    HomeScreen(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SelectionCubit>(
      create: (context) => SelectionCubit(),
      child: BlocConsumer<SelectionCubit, SelectionState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is SelectionInitial) {
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: state.index,
                onTap: (index) {
                  context.read<SelectionCubit>().onSelection(index);
                },
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: 'Home',
                    activeIcon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.explore_outlined),
                      label: 'Explore',
                      activeIcon: Icon(Icons.explore)),
                  BottomNavigationBarItem(
                      label: 'Bookmark',
                      icon: Icon(Icons.bookmark_border),
                      activeIcon: Icon(Icons.bookmark)),
                  BottomNavigationBarItem(
                      label: 'Profile',
                      icon: Icon(Icons.person_outline),
                      activeIcon: Icon(Icons.person))
                ],
              ),
              body: _pages[state.index],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
