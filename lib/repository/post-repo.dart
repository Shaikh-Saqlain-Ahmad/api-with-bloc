import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:apis_with_bloc/model/post-model.dart';
import 'package:http/http.dart' as https;

class PostRepository {
  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await https
          .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body.map((e) {
          return PostModel(
              postId: e['postId'] as int,
              id: e['id'] as int,
              name: e['name'] as String,
              email: e['email'] as String,
              body: e['body'] as String);
        }).toList();
      } else {
        // Handle non-200 status code
        throw Exception("Error: ${response.statusCode}");
      }
    } on SocketException {
      throw Exception("Error: SocketException");
    } on TimeoutException {
      throw Exception("Error: TimeoutException");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
