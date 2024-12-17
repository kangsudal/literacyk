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
    state = const AsyncLoading();
    try {
      Post post;
      if (isEdit) {
        if (postId == null) {
          throw Exception('postId가 전달되지 않았습니다.');
        }
        DateTime currentDateTime = DateTime.now();
        post = Post(
          createdAt: currentDateTime,
          updatedAt: currentDateTime,
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
      state = AsyncData(post);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}