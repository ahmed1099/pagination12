import 'package:pagination/posts_screen/model/post.dart';
import 'package:pagination/services/posts_service.dart';

class PostsRepo {
  final PostsService service;

  PostsRepo(
    this.service,
  );

  Future<List<Post>> fetchPosts(
    int page,
  ) async {
    final posts = await service.fetchPosts(
      page,
    );
    return posts
        .map(
          (
            e,
          ) =>
              Post.fromJson(
            e,
          ),
        )
        .toList();
  }
}
