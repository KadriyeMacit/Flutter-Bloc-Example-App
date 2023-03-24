import 'package:bloc_example_app/src/app_colors.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          UserAccountsDrawerHeader(
            accountName: Text('Kadriye'),
            accountEmail: Text('kadriye@gmail.com'),
            currentAccountPicture: CircleAvatar(
              // backgroundImage: AssetImage(githubLogo),
              backgroundColor: Colors.white,
            ),
            decoration: BoxDecoration(color: AppColors.primarySwatch),
          ),
        ],
      ),
    );
  }
}
