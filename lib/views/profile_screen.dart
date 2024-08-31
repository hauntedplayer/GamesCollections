import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:games_colletions/views/login_screen.dart';
import 'package:games_colletions/views/main_screen.dart';

import '../controllers/user_controller.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  void logout() {
    ref.read(userControllerProvider.notifier).logoutUser;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userControllerProvider);
    return Scaffold(
        appBar: AppBar(title: const Text('Perfil')),
        body: user != null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Logged in as ${user.user?.email}'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: logout,
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              )
            : const Center(child: Text('No user logged in')),
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star_rounded), label: 'favoritos'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()));
                case 2:
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
              }
            }));
  }
}
