import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shake/shake.dart';

import 'account_controller.dart';

import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late ShakeDetector detector;
  @override
  void initState() {
    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        setState(() {
          Navigator.pushNamed(context, "/login");
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 410,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Smart You, Smart Shopping'),
            accountEmail: Text('Welcome To Guitar Shop'),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                'https://www.vintage-guitars.se/Shop.jpg',
              ),
              fit: BoxFit.cover,
            )),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('My Orders'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.question_mark_sharp),
            title: const Text('About'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.policy),
            title: const Text('Policy'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () => Navigator.pushNamed(context, "/login"),
          ),
        ],
      ),
    );
  }
}
