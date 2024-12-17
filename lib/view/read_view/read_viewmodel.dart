import 'package:literacyk/models/post.dart';
import 'package:literacyk/repositories/post_repository.dart';
import 'package:literacyk/repositories/post_repository_provider.dart';
import 'package:literacyk/view/board_view/board_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'read_viewmodel.g.dart';

@riverpod
class ReadViewmodel extends _$ReadViewmodel {
  late PostRepository postRepository;

  @override
  FutureOr<Post?> build(String postId) async {
    postRepository = ref.watch(postRepositoryProvider);
    return await postRepository.readPost(postId);
  }

  Future<void> deletePost(String userId) async {
    try {
      await postRepository.deletePost(postId);
      ref.invalidate(boardViewModelProvider); // 게시판 목록 상태 갱신
      // 삭제 후 상태를 null로 설정 (리소스 삭제 반영)
      state = const AsyncData(null);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
      rethrow;
    }
  }
}
