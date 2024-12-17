import 'package:literacyk/models/post.dart';
import 'package:literacyk/repositories/post_repository.dart';
import 'package:literacyk/repositories/post_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'write_viewmodel.g.dart';

@riverpod
class WriteViewmodel extends _$WriteViewmodel {
  late PostRepository postRepository;
  @override
  FutureOr<Post?> build() {
    postRepository = ref.watch(postRepositoryProvider);
    return null;
  }

  Future<void> savePost({
    required String title,
    required String contents,
    required bool isEdit,
    String? postId,
  }) async {
    state = await AsyncValue.guard(() async {
      Post post;
      if (isEdit) {
        if (postId == null) {
          throw ArgumentError(
              'postId가 전달되지 않았습니다. isEdit이 true일 경우 postId는 필수입니다.');
        }
        Post? existingPost = await postRepository.readPost(postId);
        if (existingPost == null) {
          throw Exception('해당 postId에 해당하는 Post를 찾을 수 없습니다.');
        }
        post = Post(
          createdAt: existingPost.createdAt,
          updatedAt: DateTime.now(),
          id: postId,
          title: title,
          contents: contents,
        );
        await postRepository.updatePost(post);
      } else {
        DateTime currentDateTime = DateTime.now();
        post = Post(
          createdAt: currentDateTime,
          updatedAt: currentDateTime,
          title: title,
          contents: contents,
        );
        await postRepository.createPost(post);
      }
      return post; //AsyncValue.guard의 반환값이 AsyncData(post)로 설정됨
    });
  }
}
