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
            accountName: Text("Kadriye"),
            accountEmail: Text("kadriye@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
