import 'package:flutter_riverpod/flutter_riverpod.dart';

// S-BTI 진행 상태 등을 관리할 수 있습니다.
class SbtiNotifier extends StateNotifier<void> {
  SbtiNotifier() : super(null);

  // 시작하기, 건너뛰기 등의 로직을 여기에 추가
}

final sbtiProvider = StateNotifierProvider<SbtiNotifier, void>((ref) {
  return SbtiNotifier();
});