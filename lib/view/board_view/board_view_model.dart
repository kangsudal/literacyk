import 'package:literacyk/models/app_user.dart';
import 'package:literacyk/models/post.dart';
import 'package:literacyk/repositories/app_user_repository.dart';
import 'package:literacyk/repositories/app_user_repository_provider.dart';
import 'package:literacyk/repositories/post_repository.dart';
import 'package:literacyk/repositories/post_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'board_view_model.g.dart';

@riverpod
class BoardViewModel extends _$BoardViewModel {
  late PostRepository postRepository;
  late AppUserRepository appUserRepository;
  @override
  FutureOr<List<Post>> build() async {
    postRepository = ref.watch(postRepositoryProvider);
    appUserRepository = ref.watch(appUserRepositoryProvider);
    return await postRepository.fetchPosts();
  }

  Future<String> convertUidToName(String uid) async {
    AppUser appUser = await appUserRepository.getProfile(uid: uid);
    return appUser.name;
  }
}