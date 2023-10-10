import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subspacevlog/getxcontrollers/favoratescontroller.dart';
import 'package:subspacevlog/views/widgets/listtile.dart';

class FavoritesScreen extends StatelessWidget {
  final favoritesController =
      Get.find<FavoritesController>(); // Retrieve the existing controller
// Initialize the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Obx(
        () {
          final favorites = favoritesController.favorites;

          if (favorites.isEmpty) {
            return const Center(child: Text('No favorites yet.'));
          }

          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              return CustomListTile(
                blog: favorites[index],
                onFavoritePressed: () {
                  favoritesController.toggleFavorite(favorites[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
