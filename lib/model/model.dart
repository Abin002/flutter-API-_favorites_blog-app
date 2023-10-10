import 'package:get/get.dart';

class Blog {
  final String id;
  final String imageUrl;
  final String title;
  final RxBool isFavorited; // Add isFavorited property

  Blog({
    required this.id,
    required this.imageUrl,
    required this.title,
    bool isFavorited = false, // Default value is false
  }) : isFavorited = RxBool(isFavorited);

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'] as String,
      imageUrl: json['image_url'] as String,
      title: json['title'] as String,
    );
  }

  // Function to toggle the favorite status
  void toggleFavorite() {
    isFavorited.value = !isFavorited.value;
  }
}
