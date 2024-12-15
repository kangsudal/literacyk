# literacyk

## 로그인 & CRUD 게시판 기능
- 로그인 상태
- 로그아웃 상태
- signup 기능
- firestore에 데이터 저장 기능
- 비밀번호 재설정 기능
- verifyemail 

### 12/14 Bad state: Future already completed
```
[ERROR:flutter/runtime/dart_vm_initializer.cc(40)] Unhandled Exception: Bad state: Future already completed
#0      _AsyncCompleter.complete (dart:async/future_impl.dart:84:31)
#1      FutureHandlerProviderElementMixin.onData (package:riverpod/src/async_notifier/base.dart:289:17)
#2      AsyncData.map (package:riverpod/src/common.dart:346:16)
#3      FutureHandlerProviderElementMixin.state= (package:riverpod/src/async_notifier/base.dart:212:14)
#4      AsyncNotifierBase.state= (package:riverpod/src/async_notifier.dart:66:14)
#5      VerifyEmailViewmodel.sendEmailVerification (package:literacyk/view/verify_email_view/verify_email_viewmodel.dart:24:5)
<asynchronous suspension>

[ERROR:flutter/runtime/dart_vm_initializer.cc(40)] Unhandled Exception: Bad state: Future already completed
#0      _AsyncCompleter.complete (dart:async/future_impl.dart:84:31)
#1      FutureHandlerProviderElementMixin.onData (package:riverpod/src/async_notifier/base.dart:289:17)
#2      AsyncData.map (package:riverpod/src/common.dart:346:16)
#3      FutureHandlerProviderElementMixin.state= (package:riverpod/src/async_notifier/base.dart:212:14)
#4      AsyncNotifierBase.state= (package:riverpod/src/async_notifier.dart:66:14)
#5      VerifyEmailViewmodel.reloadUser (package:literacyk/view/verify_email_view/verify_email_viewmodel.dart:30:5)
<asynchronous suspension>
#6      _VerifyEmailViewState.checkEmailVerified (package:literacyk/view/verify_email_view/verify_email_view.dart:63:7)
```
https://github.com/rrousselGit/riverpod/issues/1879 의 
```
class SomeNotifier extends AutoDisposeAsyncNotifier<void> {
  late Object? key; // 1. create a key

  @override
  void build() {
    key = Object(); // 2. initialize it
    ref.onDispose(() => key = null); // 3. set to null on dispose
  }

  void fn() async {
    final key = this.key; // 4. grab the key before doing any async work
    await someAsyncWork():
    if (key == this.key) { // 5. Check if the key is still the same
      // still mounted
    }
  }
}
```
와 같이 다음처럼 코드를 수정하였다.
```
import 'package:literacyk/repositories/auth_repository.dart';
import 'package:literacyk/repositories/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verify_email_viewmodel.g.dart';

@riverpod
class VerifyEmailViewmodel extends _$VerifyEmailViewmodel {
  late AuthRepository authRepository;
  Object? _key;

  @override
  FutureOr<void> build() {
    authRepository = ref.read(authRepositoryProvider);
    _key = Object();
    ref.onDispose(() {
      _key = null;
    });
  }

  Future<void> signout() async {
    state = const AsyncLoading<void>();
    final key = _key;
    final result = await AsyncValue.guard(
      () => authRepository.signout(),
    );
    if (key == _key) {
      state = result;
    }
  }

  Future<void> sendEmailVerification() async {
    state = const AsyncLoading<void>();
    final key = _key;
    final result = await AsyncValue.guard(
      () => authRepository.sendEmailVerification(),
    );
    if (key == _key) {
      state = result;
    }
  }

  Future<void> reloadUser() async {
    state = const AsyncLoading<void>();
    final key = _key;
    final result = await AsyncValue.guard(
      () => authRepository.reloadUser(),
    );
    if (key == _key) {
      state = result;
    }
  }
}
```
provider가 dispose됐는데 접근하려고 하고 데이터를 변경하려는 시도를 한다면 생기는 문제라고 한다. <br>
disposed되지않았을때만 상태를 업데이트해주면된다.
<br> <br>
비동기 작업을 사용할 때는 provider의 생명주기를 고려해야 하며, 특히 화면이 dispose될 경우 작업 결과를 무조건적으로 상태에 반영하는 것은 피해야 한다. <br>
이를 위해 onDispose와 _key 같은 메커니즘을 활용하여 상태를 관리할 수 있다.

### 12/15 설계 고민과 결정 사항
#### 1. 상태를 어떻게 나눌까?
고민 <br>
Home 화면에서 사용자 정보(`AppUser`)와 게시판 글 목록(`List<Post>`) 두 가지 상태를 관리해야 했다.
하나의 ViewModel에서 두 상태를 **하나의 객체로 묶어 함께** 관리할지, **각각 나눌지** 고민이 있었다.
<br><br>

결정 <br>
상태를 두 개의 ViewModel로 분리했다.
- UserProfileViewModel: 사용자 정보를 관리한다.
- BoardViewModel: 게시판 글 목록을 관리한다.

이유<br>
하나의 ViewModel이 하나의 상태만 관리하도록 했다.<br>
사용자 프로필과 게시판을 다른 화면에서도 독립적으로 재사용할 수 있도록 했다.<br>
<br><br>
#### 2. HomeView의 역할
고민<br>
HomeView가 상태를 직접 관리해야 할지, 하위 View를 만들어서 각 View에 역할을 맡길지 고민했다.
<br><br>

결정<br>
HomeView는 하위 View를 조합하는 역할만 하도록 만들었다.
- UserProfileView: 사용자 프로필을 표시한다.
- BoardView: 게시판 글 목록을 표시한다.

이유<br>
깔끔한 구조: HomeView는 화면 레이아웃만 담당하게 하고, 각 View가 상태를 독립적으로 관리하도록 했다.<br>
확장성: 사용자 정보나 게시판 기능이 확장되더라도 HomeView는 수정할 필요가 없도록 했다.<br>
<img width="450" alt="image" src="https://github.com/user-attachments/assets/274b77f1-c029-413e-aec5-9302d4f9bd3e" />
