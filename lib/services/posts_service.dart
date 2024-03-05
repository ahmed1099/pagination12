import 'dart:convert';

import 'package:http/http.dart';

class PostsService {
  static const fetchLimit = 5;
  final baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<dynamic>> fetchPosts(
    int page,
  ) async {
    try {
      final response = await get(
        Uri.parse(
          "$baseUrl?_limit=$fetchLimit&_page=$page",
        ),
      );
      return jsonDecode(
        response.body,
      ) as List<dynamic>;
    } catch (err) {
      return [];
    }
  }
}
