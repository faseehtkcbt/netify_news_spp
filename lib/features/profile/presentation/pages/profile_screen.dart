import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/color_pallette/app_pallette.dart';
import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/core/utils/network_image.dart';
import 'package:news_app/features/auth/domain/entity/user_entity.dart';
import 'package:news_app/features/profile/presentation/bloc/profile_bloc.dart';

import '../../../../config/route/routes.dart';
import '../../../../core/utils/loader.dart';
import '../widget/profile_list_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileBloc>().add(GetProfileData());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppText(
            text: 'Profile',
            textStyle: Theme.of(context).textTheme.titleMedium,
            textSize: 20,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, profileState) {
              // TODO: implement listener
            },
            builder: (context, profileState) {
              if (profileState is ProfileLoaded<UserEntity>) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 15, bottom: 15, right: 15, top: 30),
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: profileState.data.photoUrl != ""
                              ? NetworkImageUrl(
                                  url: profileState.data.photoUrl,
                                  height: 50,
                                  width: 50)
                              : CircleAvatar(
                                  radius: 50,
                                  backgroundColor: AppPellete.themeColor,
                                  child: AppText(
                                    text: profileState.data.name
                                        .substring(0, 1)
                                        .toUpperCase(),
                                    textStyle:
                                        Theme.of(context).textTheme.titleMedium,
                                    textSize: 30,
                                    textColor: AppPellete.textWhiteColor,
                                  ),
                                )),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: AppText(
                          text: profileState.data.name.toUpperCase(),
                          textStyle: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Center(
                        child: AppText(
                          text: profileState.data.email,
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ProfileListTile(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.selectCountryPage);
                        },
                        listTitle: 'Edit Profile',
                        icon: Icons.person_outline,
                      ),
                      ProfileListTile(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.selectCountryPage);
                        },
                        listTitle: 'Change selected country',
                        icon: Icons.south_america_rounded,
                      ),
                      ProfileListTile(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.privacyPolicyPage);
                        },
                        listTitle: 'Privacy Policy',
                        icon: Icons.sticky_note_2_outlined,
                      ),
                      ProfileListTile(
                        onTap: () {},
                        listTitle: 'Log out',
                        icon: Icons.logout_outlined,
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Loader(),
                );
              }
            },
          ),
        ));
  }
}
