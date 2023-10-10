import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subspacevlog/getxcontrollers/favoratescontroller.dart';
import 'package:subspacevlog/services/api.dart';

import 'package:subspacevlog/views/homescreen.dart';

void main() {
  final favoritesController = FavoritesController(); // Create a single instance
  runApp(MyApp(favoritesController: favoritesController));
}

class MyApp extends StatelessWidget {
  final FavoritesController favoritesController;

  const MyApp({Key? key, required this.favoritesController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      initialBinding: BindingsBuilder(() {
        Get.put(favoritesController); // Provide the controller globally
      }),
      home: ScreenHome(futureBlogs: Apiservices().fetchBlogs()),
    );
  }
}
