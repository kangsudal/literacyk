import 'package:literacyk/models/post.dart';
import 'package:literacyk/repositories/post_repository.dart';
import 'package:literacyk/repositories/post_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'board_view_model.g.dart';

@riverpod
class BoardViewModel extends _$BoardViewModel {
  late PostRepository postRepository;
  @override
  FutureOr<List<Post>> build() async {
    postRepository = ref.watch(postRepositoryProvider);
    return await postRepository.fetchPosts();
  }
}