import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:games_colletions/views/favorite_screen.dart';
import 'package:games_colletions/views/profile_screen.dart';

import '../controllers/game_controller.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final games = ref.watch(gameControllerProvider);

    return Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: const InputDecoration(hintText: 'Search games'),
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
              ref
                  .read(gameControllerProvider.notifier)
                  .searchGames(_searchQuery);
            },
          ),
        ),
        body: games.isEmpty
            ? const Center(child: Text('No games found'))
            : ListView.builder(
                itemCount: games.length,
                itemBuilder: (context, index) {
                  final game = games[index];
                  return ListTile(
                    leading: Image.network(game.image),
                    title: Text(game.name),
                  );
                },
              ),
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
                
                // case 1:
                //   Navigator.pushReplacement(context,
                //       MaterialPageRoute(builder: (context) => Favorite_screen()));
                case 2:
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
              }
            }));
  }
}
