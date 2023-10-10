import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subspacevlog/getxcontrollers/favoratescontroller.dart';
import 'package:subspacevlog/model/model.dart';
import 'package:subspacevlog/services/api.dart';
import 'package:subspacevlog/views/favorates.dart';

import 'package:subspacevlog/views/widgets/listtile.dart';

class ScreenHome extends StatelessWidget {
  final Apiservices apiservices = Apiservices();
  final Future<List<Blog>> futureBlogs;

  ScreenHome({Key? key, required this.futureBlogs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesController =
        Get.find<FavoritesController>(); // Initialize the controller

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          onPressed: () {
            Get.to(FavoritesScreen());
          },
          icon: const Icon(
            Icons.favorite,
          ),
          splashRadius: 10,
          splashColor: Colors.redAccent,
        ),
        centerTitle: true,
        title: const Text(
          'BlogSpot',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<Blog>>(
        future: futureBlogs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
                child: Text(
              'Please Connect to a Network :)',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No blogs available.'));
          } else {
            final blogs = snapshot.data!;
            return ListView.builder(
              itemCount: blogs.length,
              itemBuilder: (context, index) {
                return CustomListTile(
                  blog: blogs[index],
                  onFavoritePressed: () {
                    favoritesController.toggleFavorite(blogs[index]);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
