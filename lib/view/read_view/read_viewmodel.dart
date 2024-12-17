import 'package:literacyk/models/post.dart';
import 'package:literacyk/repositories/post_repository.dart';
import 'package:literacyk/repositories/post_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'read_viewmodel.g.dart';

@riverpod
class ReadViewmodel extends _$ReadViewmodel{
  late PostRepository postRepository;

  @override
  FutureOr<Post?> build(String postId) async {
    postRepository = ref.watch(postRepositoryProvider);
    return await postRepository.readPost(postId);
  }
}