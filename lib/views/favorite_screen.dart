import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:games_colletions/controllers/user_controller.dart';
import 'package:games_colletions/views/main_screen.dart';
import 'package:games_colletions/views/profile_screen.dart';

class Favorite_screen extends ConsumerStatefulWidget {
  const Favorite_screen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Favorite_screenextendsState();
}

class _Favorite_screenextendsState extends ConsumerState<Favorite_screen> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userControllerProvider);

    return Scaffold(
        appBar: AppBar(title: const Text('Favorites'), centerTitle: true,),
        body: user != null
            ? Center(child: Text('Logged in as ${user.username}'))
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
