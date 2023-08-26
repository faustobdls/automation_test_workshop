import 'package:automation_test_workshop/screens/buttom.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/favorites.dart';
import 'favorites.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing Sample'),
        leading: IconButton(
          onPressed: () => context.go('/${ButtonsPage.routeName}'),
          icon: const Icon(Icons.abc),
        ),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {
              context.go('/${FavoritesPage.routeName}');
            },
            icon: const Icon(Icons.favorite_border),
            label: const Text('Favorites'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        cacheExtent: 20.0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemTile(index),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(this.itemNo, {super.key});

  @override
  Widget build(BuildContext context) {
    var favoritesList = context.get<Favorites>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text(
          'Item $itemNo',
          key: Key('text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('icon_$itemNo'),
          icon: favoritesList.items.contains(itemNo)
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          onPressed: () {
            !favoritesList.items.contains(itemNo)
                ? favoritesList.add(itemNo)
                : favoritesList.remove(itemNo);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(favoritesList.items.contains(itemNo)
                    ? 'Added to favorites.'
                    : 'Removed from favorites.'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}

extension ContextExt on BuildContext {
  T get<T>() => Provider.of<T>(this);
}
