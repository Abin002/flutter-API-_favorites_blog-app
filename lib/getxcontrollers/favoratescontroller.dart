import 'package:get/get.dart';
import 'package:subspacevlog/model/model.dart';

class FavoritesController extends GetxController {
  final RxList<Blog> favorites = <Blog>[].obs;

  void addToFavorites(Blog blog) {
    // Check if the blog is not already in favorites
    if (!favorites.any((favoriteBlog) => favoriteBlog.id == blog.id)) {
      favorites.add(blog);
      print('Added to favorites: ${blog.title}');
    }
  }

  void removeFromFavorites(Blog blog) {
    favorites.remove(blog);
    print('Removed from favorites: ${blog.title}');
    print('Current favorites:');
    favorites.forEach((favoriteBlog) {
      print(favoriteBlog.title);
    });
  }

  // Toggle function to add/remove a blog from favorites
  void toggleFavorite(Blog blog) {
    if (favorites.any((favoriteBlog) => favoriteBlog.id == blog.id)) {
      removeFromFavorites(blog);
    } else {
      addToFavorites(blog);
    }
  }
}
