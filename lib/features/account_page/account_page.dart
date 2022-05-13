import 'package:animals/authentication/cubit/authentication_cubit.dart';
import 'package:animals/features/favorites_firebase/favorites_firebase_page.dart';
import 'package:animals/features/favorites_hive/favorites_hive.dart';
import 'package:animals/features/list_page/list_page.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  var currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: const Text(
          'Read something about animals!',
          style: AppTypography.h2,
        ),
      ),
      body: Builder(
        builder: (context) {
          if (currentIndex == 0) {
            return HomeListPage();
          }
          if (currentIndex == 1) {
            return FavoritesHive();
          }
          if (currentIndex == 2) {
            return FavoritesFirebase();
          }
          return Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: AppColors.mainColor),
              onPressed: () {
                context.read<AuthenticationCubit>().signOut();
              },
              child: Text('Wyloguj'),
            ),
          );
          ;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColors.mainColor,
            label: 'Search',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.mainColor,
            label: 'Hive',
            icon: Icon(Icons.bug_report),
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.mainColor,
            label: 'My Favorites',
            icon: Icon(Icons.star),
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.mainColor,
            label: 'Account',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
