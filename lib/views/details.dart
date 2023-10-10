import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subspacevlog/getxcontrollers/favoratescontroller.dart';
import 'package:subspacevlog/model/model.dart';

class Details extends StatelessWidget {
  final Blog blog;
  final FavoritesController favoritesController =
      Get.find<FavoritesController>();

  Details({
    required this.blog,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Image.network(
                blog.imageUrl,
                alignment: Alignment.bottomCenter,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                blog.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Obx(() {
        final isFavorited = blog.isFavorited.value;
        return FloatingActionButton(
          backgroundColor: Colors.white,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: () {
            blog.toggleFavorite(); // Toggle the isFavorited property
            favoritesController.toggleFavorite(blog);
          },
          child: Icon(
            Icons.favorite,
            color: isFavorited
                ? Colors.redAccent
                : Colors.grey, // Change color based on isFavorited
          ),
        );
      }),
    );
  }
}
