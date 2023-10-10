import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subspacevlog/model/model.dart';
import 'package:subspacevlog/views/details.dart';

class CustomListTile extends StatelessWidget {
  final Blog blog;
  final Function() onFavoritePressed;

  CustomListTile({
    required this.blog,
    required this.onFavoritePressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Get.to(Details(
            blog: blog,
          ));
          // Handle tapping on the entire card
        },
        child: Card(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      blog.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                // Use Expanded to allow text to wrap
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      blog.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Obx(() {
                // Use Obx to update the icon based on blog.isFavorited
                final isFavorited = blog.isFavorited.value;
                return IconButton(
                  onPressed: () {
                    blog.isFavorited();
                    onFavoritePressed();
                    blog.toggleFavorite();

                    // Do nothing when IconButton is pressed to avoid double tap
                  },
                  icon: Icon(
                    isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: isFavorited ? Colors.red : Colors.grey,
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
