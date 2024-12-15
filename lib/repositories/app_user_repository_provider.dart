import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_user_repository_provider.g.dart';

@riverpod
AppUserRepository appUserRepository(Ref ref){
  return AppUserRepository();
}