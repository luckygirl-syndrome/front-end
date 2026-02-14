import 'package:flutter_riverpod/flutter_riverpod.dart';

// 상태 클래스
class InitialQuestionState {
  final int currentIndex;
  final Set<String> selectedMalls; // 복수 선택용
  final String chugumiText;        // 추구미 입력용
  final bool isFinished;           // 모든 질문 완료 여부

  InitialQuestionState({
    this.currentIndex = 0,
    this.selectedMalls = const {},
    this.chugumiText = '',
    this.isFinished = false,
  });

  InitialQuestionState copyWith({
    int? currentIndex,
    Set<String>? selectedMalls,
    String? chugumiText,
    bool? isFinished,
  }) {
    return InitialQuestionState(
      currentIndex: currentIndex ?? this.currentIndex,
      selectedMalls: selectedMalls ?? this.selectedMalls,
      chugumiText: chugumiText ?? this.chugumiText,
      isFinished: isFinished ?? this.isFinished,
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

  void nextPage() {
    // 질문이 2개(0, 1)이므로, 1에서 다음을 누르면 완료 상태로 변경
    if (state.currentIndex < 1) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    } else {
      state = state.copyWith(isFinished: true);
    }
  }
  void previousPage() {
    if (state.currentIndex > 0) {
      state = state.copyWith(currentIndex: state.currentIndex - 1);
    }
  }

  // 리셋 (필요시)
  void reset() => state = InitialQuestionState();
}

// 프로바이더 선언
final initialQuestionProvider =
    StateNotifierProvider<InitialQuestionNotifier, InitialQuestionState>((ref) {
  return InitialQuestionNotifier();
});