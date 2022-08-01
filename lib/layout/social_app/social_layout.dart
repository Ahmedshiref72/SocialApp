import 'package:App/layout/social_app/cubit/cubit.dart';
import 'package:App/layout/social_app/cubit/state.dart';
import 'package:App/modules/social_app/new_post/new_post_screen.dart';
import 'package:App/shared/components/components.dart';
import 'package:App/shared/style/icon_broken.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if(state is SocialNewPostState)
          {
            navigateTo(context, NewPostScreen(),);
          }
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
              // style: TextStyle(
              //   fontSize: 25
              // ),
            ),
            actions: [
              IconButton(
                onPressed: (){},
                icon: Icon(
                  IconBroken.Search,
                ),
              ),
              IconButton(
                  onPressed: (){},
                  icon: Icon(IconBroken.Notification,
                  ),
              ),


            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index,context);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                IconBroken.Home,
              ),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Chat,


                ),
                  label: 'Chats'

              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Plus,


                  ),
                  label: 'Post',

              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Location,
                ),
                  label: 'Users'

              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Profile,
                ),
                  label: 'Profile'

              ),
            ],
          ),
        );
      },
    );
  }
}
