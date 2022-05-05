import 'package:animals/features/list_page/list_page.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/colors.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  var currentIndex = 0;
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
          if (currentIndex == 1) {
            return HomeListPage();
          }
          if (currentIndex == 0) {
            return Center(
              child: Text('Accout Page'),
            );
          }
          return Center(
            child: Text('Favorites'),
          );
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
            label: 'Account',
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'My Favorites',
            icon: Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}
