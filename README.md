# literacyk
## 프로젝트 소개
Firebase와 Flutter를 이용한 인증 및 CRUD 게시판 기능을 구현한 앱

## 기술 스택
프레임워크(언어): Flutter(Dart)<br>
백엔드 서비스: Firebase Authentication, Firestore
<br><br>

## 주요 기능
### 1. 사용자 인증
- 로그인 상태
- 로그아웃 상태
- signup 기능
- firestore에 데이터 저장 기능
- 비밀번호 재설정 기능
- verifyemail 
비밀번호 기반 로그인을 구현하기 위해 FirebaseAuth 패키지를 사용했다.<br>
사용자가 이메일과 비밀번호를 입력하면 Firebase에서 사용자 인증을 처리하고, 성공하면 UserCredential 객체를 반환하는 구조이다.<br>
`UserCredential`이란? User 객체와 OAuthCredential 객체, 인증 관련 메서드들을 포함하고있는 객체<br>
`signInWithEmailAndPassword`가 하는 일: 이 메서드는 Firebase 서버에 인증 요청을 보내고, 해당 사용자의 이메일과 비밀번호가 일치하면 세션 정보를 가져온다. 이 과정에서 내부적으로 토큰을 발급받는 것으로 알고 있음.<br>
`reloadUser`: 서버에서 사용자 정보를 최신화(Firebase는 이메일 인증 상태를 클라이언트에 자동으로 반영하지 않기 때문에)


### 2.CRUD 게시판



## 문제 해결 과정
### Bad state: Future already completed
provider가 dispose됐는데 접근하려고 하고 데이터를 변경하려는 시도를 한다면 생기는 문제라고 한다. <br>
disposed되지않았을때만 상태를 업데이트해주면된다.
<br> <br>
비동기 작업을 사용할 때는 provider의 생명주기를 고려해야 하며, 특히 화면이 dispose될 경우 작업 결과를 무조건적으로 상태에 반영하는 것은 피해야 한다. <br>
이를 위해 onDispose와 _key 같은 메커니즘을 활용하여 상태를 관리할 수 있다.<br>
**해결코드:_key를 사용한 상태관리**
```
@riverpod
class VerifyEmailViewmodel extends _$VerifyEmailViewmodel {
  late AuthRepository authRepository;
  Object? _key; //1. 키 생성

  @override
  FutureOr<void> build() {
    authRepository = ref.read(authRepositoryProvider);
    _key = Object(); //2. 생성한 키 초기화
    ref.onDispose(() {
      _key = null; //3. provider가 dispose됐을때 null 할당
    });
  }

  Future<void> reloadUser() async {
    state = const AsyncLoading<void>();
    final key = _key; //4. 비동기 작업을 실행하기 전에 key 값을 저장
    final result = await AsyncValue.guard( //5. AsyncValue 상태 결과값을 임시 저장
      () => authRepository.reloadUser(),
    );
    if (key == _key) { //6. 키가 여전히 유효한지(null로 바뀌지 않은지) 확인
      state = result; //7. 상태 반영
    }
  }
}
```
`AsyncValue.guard`는 try-catch를 간소화해서 비동기 상태를 처리할 수 있는 Riverpod의 유틸리티다.
성공과 실패를 자동으로 AsyncValue 상태에 맞게 반환.

### 설계 고민과 결정 사항
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

### 설계 및 구조
#### MVVM 패턴
- Model: Firebase Authentication 및 Firestore 데이터
- View: 로그인 화면, 게시판 화면
- ViewModel: AuthViewModel, UserProfileViewModel, BoardViewModel

