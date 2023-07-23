import 'dart:convert';

import 'package:http/http.dart';
import 'package:ready_pagination/core/handle_error/execptions.dart';

import '../model/post.dart';

abstract class RemoteData {
  Future<List<Post>> getData(
      {required int pageNumber, required int numberOfPostsPerRequest});
}

class RemoteDataImpl extends RemoteData {
  @override
  Future<List<Post>> getData(
      {required int pageNumber, required int numberOfPostsPerRequest}) async {
    final response = await get(Uri.parse(
        "https://jsonplaceholder.typicode.com/posts?_page=$pageNumber&_limit=$numberOfPostsPerRequest"));

    try {
      List responseList = json.decode(response.body);
      List<Post> postList = responseList
          .map((data) => Post(data['title'], data['body']))
          .toList();
      return postList;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
