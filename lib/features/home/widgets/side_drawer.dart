import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/loading_page.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/models/user_model.dart';
import 'package:twitter_clone/theme/pallete.dart';

class SideDrawer extends ConsumerWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserAccountProvider).value;

    if (currentUser == null) {
      return const Loader();
    }

    return SafeArea(
        child: Drawer(
      backgroundColor: Pallete.backgroundColor,
      child: Column(
        children: [
          const SizedBox(height: 50),
          ListTile(
            leading: const Icon(
              Icons.person,
              size: 30,
            ),
            title: const Text(
              'My Profile',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.payment,
              size: 30,
            ),
            title: const Text(
              'Twitter Blue',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            onTap: () {
            
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              size: 30,
            ),
            title: const Text(
              'Log Out',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    ));
  }
}
