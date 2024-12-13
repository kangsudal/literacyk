import 'package:firebase_auth/firebase_auth.dart';
import 'package:literacyk/models/custom_error.dart';

CustomError handleException(e) {
  try {
    throw e;
  } on FirebaseAuthException catch (e) {
    String errorMessage;

    switch (e.code) {
      case 'email-already-in-use':
        errorMessage = '이미 사용 중인 이메일입니다. 다른 이메일을 입력해주세요.';
        break;
      case 'invalid-email':
        errorMessage = '유효하지 않은 이메일 주소입니다. 다시 확인해주세요.';
        break;
      case 'operation-not-allowed':
        errorMessage =
            '현재 이메일/비밀번호 계정이 비활성화되어 있습니다. Firebase Console에서 활성화해주세요.';
        break;
      case 'weak-password':
        errorMessage = '비밀번호가 너무 약합니다. 더 강력한 비밀번호를 입력해주세요. (최소 6자 이상 권장)';
        break;
      case 'too-many-requests':
        errorMessage = '너무 많은 요청을 시도했습니다. 잠시 후 다시 시도해주세요.';
        break;
      case 'user-token-expired':
        errorMessage = '로그인 세션이 만료되었습니다. 다시 로그인해주세요.';
        break;
      case 'network-request-failed':
        errorMessage = '네트워크 오류가 발생했습니다. 인터넷 연결을 확인해주세요.';
        break;
      default:
        errorMessage = e.message ?? '알 수 없는 오류가 발생했습니다.';
    }
    return CustomError(
      code: e.code,
      message: errorMessage,
      plugin: e.plugin,
    );
  } on FirebaseException catch (e) {
    return CustomError(
      code: e.code,
      message: e.message ?? 'Firebase Error',
      plugin: e.plugin,
    );
  } catch (e) {
    return CustomError(
      code: 'Exception',
      message: e.toString(),
      plugin: 'Unknown error',
    );
  }
}
