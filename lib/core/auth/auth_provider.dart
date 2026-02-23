import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttobaba/core/network/dio_provider.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthState extends _$AuthState {
  @override
  FutureOr<bool> build() async {
    final storage = ref.read(secureStorageProvider);
    final token = await storage.read(key: 'access_token');
    return token != null;
  }

  /// 토큰 상태를 강제로 새로고침합니다.
  void refresh() {
    ref.invalidateSelf();
  }
}
