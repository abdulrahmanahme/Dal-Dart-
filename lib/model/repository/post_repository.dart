import '../Api/post_api.dart';
import '../model/psot_model.dart';

class PostRepository {
  PostRepository({required this.postsApi,});
  final PostsApi postsApi;
  Future<PostModel> fetchPosts({ required  page ,required String endpoint}) async {
    final postsData = await postsApi.getPosts(page: page,endpoint: endpoint);
    return postsData;
  }
}
