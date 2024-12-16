import 'package:literacyk/repositories/post_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'post_repository_provider.g.dart';

@riverpod
PostRepository postRepository(Ref ref){
  return PostRepository();
}