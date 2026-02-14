import 'package:flutter_riverpod/flutter_riverpod.dart';

// 상태 클래스
class InitialQuestionState {
  final int currentIndex;
  final Set<String> selectedMalls; // 복수 선택용
  final String chugumiText;        // 추구미 입력용

  InitialQuestionState({
    this.currentIndex = 0,
    this.selectedMalls = const {},
    this.chugumiText = '',
  });

  InitialQuestionState copyWith({
    int? currentIndex,
    Set<String>? selectedMalls,
    String? chugumiText,
  }) {
    return InitialQuestionState(
      currentIndex: currentIndex ?? this.currentIndex,
      selectedMalls: selectedMalls ?? this.selectedMalls,
      chugumiText: chugumiText ?? this.chugumiText,
    );
  }
}

// 노티파이어
class InitialQuestionNotifier extends StateNotifier<InitialQuestionState> {
  InitialQuestionNotifier() : super(InitialQuestionState());

  // 쇼핑몰 토글 (복수 선택)
  void toggleMall(String mall) {
    final updatedMalls = Set<String>.from(state.selectedMalls);
    if (updatedMalls.contains(mall)) {
      updatedMalls.remove(mall);
    } else {
      updatedMalls.add(mall);
    }
    state = state.copyWith(selectedMalls: updatedMalls);
  }

  // 추구미 텍스트 업데이트
  void updateChugumi(String text) {
    state = state.copyWith(chugumiText: text);
  }

  void nextPage() => state = state.copyWith(currentIndex: state.currentIndex + 1);
  void previousPage() => state = state.copyWith(currentIndex: state.currentIndex - 1);
}

// 프로바이더 선언
final initialQuestionProvider =
    StateNotifierProvider<InitialQuestionNotifier, InitialQuestionState>((ref) {
  return InitialQuestionNotifier();
});