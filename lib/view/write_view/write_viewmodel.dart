import 'package:literacyk/constants/firebase_constants.dart';
import 'package:literacyk/models/app_user.dart';
import 'package:literacyk/models/custom_error.dart';
import 'package:literacyk/models/post.dart';
import 'package:literacyk/repositories/app_user_repository.dart';
import 'package:literacyk/repositories/app_user_repository_provider.dart';
import 'package:literacyk/repositories/post_repository.dart';
import 'package:literacyk/repositories/post_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'write_viewmodel.g.dart';

@riverpod
class WriteViewmodel extends _$WriteViewmodel {
  late PostRepository postRepository;
  late AppUserRepository appUserRepository;
  @override
  FutureOr<Post?> build(String? postId) async {
    postRepository = ref.watch(postRepositoryProvider);
    appUserRepository = ref.watch(appUserRepositoryProvider);
    // postId가 있으면 수정모드
    if (postId != null) {
      // 기존 게시물 불러옴
      return await postRepository.readPost(postId);
    }
    return null; // 새 게시물 작성 모드
  }

  Future<void> savePost({
    required String title,
    required String contents,
    required bool isEdit,
    required String? postId,
  }) async {
    state = await AsyncValue.guard(() async {
      Post post;
      if (isEdit) {
        if (postId == null) {
          throw CustomError(
            code: 'Exception',
            message: 'postId가 전달되지 않았습니다. isEdit이 true일 경우 postId는 필수입니다.',
            plugin: 'Custom error',
          );
        }
        Post? existingPost = await postRepository.readPost(postId);
        if (existingPost == null) {
          throw CustomError(
            code: 'Exception',
            message: '해당 postId에 해당하는 Post를 찾을 수 없습니다.',
            plugin: 'Custom error',
          );
        }
        post = Post(
          createdAt: existingPost.createdAt,
          updatedAt: DateTime.now(),
          id: postId,
          title: title,
          contents: contents,
          createdBy: existingPost.createdBy,
        );
        await postRepository.updatePost(post);
      } else {
        final currentUid = fbAuth.currentUser!.uid;
        AppUser currentAppUser =
            await appUserRepository.getProfile(uid: currentUid);
        DateTime currentDateTime = DateTime.now();
        post = Post(
          createdAt: currentDateTime,
          updatedAt: currentDateTime,
          title: title,
          contents: contents,
          createdBy: currentAppUser.id,
        );
        await postRepository.createPost(post);
      }
      return post; //AsyncValue.guard의 반환값이 AsyncData(post)로 설정됨
    });
  }
}
