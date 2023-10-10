import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:subspacevlog/model/model.dart';

class Apiservices {
  Future<List<Blog>> fetchBlogs() async {
    const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    const String adminSecret =
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        // Parse the response JSON
        final List<dynamic> jsonData = json.decode(response.body)['blogs'];

        // Map the JSON data to a list of Blog objects
        final List<Blog> blogs =
            jsonData.map((json) => Blog.fromJson(json)).toList();

        return blogs;
      } else {
        // Request failed, throw an exception or return an empty list based on your preference
        throw Exception(
            'Request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      throw Exception('Error: $e');
    }
  }
}
