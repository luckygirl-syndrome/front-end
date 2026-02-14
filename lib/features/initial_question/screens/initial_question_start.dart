import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ttobaba/features/signup/widgets/signup_app_bar.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../sbti/widgets/sbti_action_buttons.dart'; // 이전에 만든 섀도우 버튼

class InitialQuestionStartScreen extends ConsumerWidget {
  const InitialQuestionStartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack( // 1. 배경과 콘텐츠를 겹치기 위해 Stack 사용
        children: [
          // 2. 배경 그라데이션 (화면 전체 차지)
          // 2. 배경 그라데이션 (화면 절반에서 딱 끊기는 효과)
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white,           // 40% 지점까지 흰색 유지
                    AppColors.primaryMain,  // 여기서부터 노란색 시작
                    Colors.white
                  ],
                  // 0.4(40%)까지는 흰색, 0.401(거의 같은 지점)부터 노란색을 주면
                  // 그라데이션이 아니라 "면 분할" 느낌으로 딱 끊깁니다.
                  stops: [0.0, 0.35, 0.351, 1.0], 
                ),
              ),
            ),
          ),

          // 2. ⭐ 캐릭터 이미지를 화면 전체의 중앙에 배치
          Center(
            child: Image.asset(
              'assets/images/initial_question_cat.png',
              height: 96,
            ),
          ),

          // 3. 실제 콘텐츠 (이것만 SafeArea로 감싸서 보호)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Text(
                    '거의 다 끝났어요\n\n또바가 OO 님을 더 잘 알기 위해\n딱 2가지만 더 물어볼게요!',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.ptdBold(24),
                  ),
                  
                  const Spacer(),

                  // 하단 버튼 영역
                  SbtiActionButtons(
                    onDislike: () => context.go('/sbti_no_like'),
                    onLike: () => context.go('/initial_question'),
                    dislikeText: '이젠 힘들어요',
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}