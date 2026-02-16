// lib/features/my/view/my_page_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../provider/my_page_state';

class MyPageScreen extends ConsumerWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myPageProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8), // 연한 회색 배경
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. 상단 노란색 프로필 영역
            _ProfileHeader(state: state),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    '나의 S-BTI',
                    style: AppTextStyles.ptdBold(24),
                  ),

                  const SizedBox(height: 16),
                  
                  // 2. S-BTI 결과 차트 카드
                  _SbtiResultCard(scores: state.sbtiScores),
                  
                  const SizedBox(height: 30),
                  
                  Text(
                    '나의 옷장',
                    style: AppTextStyles.ptdBold(24),
                  ),

                  const SizedBox(height: 16),
                  
                  // 3. 옷장 통계 (가로 병렬)
                  Row(
                    children: [
                      Expanded(child: _ClosetStatCard(title: '고심 끝에 구매한 옷', count: state.boughtCount)),
                      const SizedBox(width: 12),
                      Expanded(child: _ClosetStatCard(title: '아쉽지만 포기한 옷', count: state.gaveUpCount)),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Screen 파일 하단에 위치 ---

class _ProfileHeader extends StatelessWidget {
  final MyPageState state;
  const _ProfileHeader({required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.primaryMain, // 노란색
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(100)), // 둥근 하단
      ),
      padding: const EdgeInsets.only(top: 60, bottom: 30),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Image.asset('assets/images/profile_cat.png', height: 70),
          ),
          const SizedBox(height: 16),
          Text(state.title, style: AppTextStyles.ptdBold(22)),
          Text(state.nickname, style: AppTextStyles.ptdRegular(16)),
          const SizedBox(height: 12),
          AppButton(
            text: '프로필 설정',
            width: 100,
            padding: const EdgeInsets.symmetric(vertical: 4),
            textStyle: AppTextStyles.ptdMedium(14),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _SbtiResultCard extends StatelessWidget {
  final Map<String, double> scores;
  const _SbtiResultCard({required this.scores});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SbtiBar(topLabel: 'D', topSub: '도파민', bottomLabel: 'N', bottomSub: '생존', value: scores['D'] ?? 0),
          _SbtiBar(topLabel: 'S', topSub: '사회 자극', bottomLabel: 'A', bottomSub: '미적 자극', value: scores['S'] ?? 0),
          _SbtiBar(topLabel: 'M', topSub: '마이웨이', bottomLabel: 'T', bottomSub: '유행', value: scores['T'] ?? 0),
        ],
      ),
    );
  }
}

// 💡 S-BTI 전용 바 차트 위젯
class _SbtiBar extends StatelessWidget {
  final String topLabel, topSub, bottomLabel, bottomSub;
  final double value; // 0.0 ~ 1.0

  const _SbtiBar({required this.topLabel, required this.topSub, required this.bottomLabel, required this.bottomSub, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(topLabel, style: AppTextStyles.ptdBold(18)),
        Text(topSub, style: AppTextStyles.ptdRegular(12)),
        const SizedBox(height: 8),
        Container(
          width: 6, height: 100,
          decoration: BoxDecoration(color: const Color(0xFFEEEEEE), borderRadius: BorderRadius.circular(3)),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              FractionallySizedBox(
                heightFactor: value,
                child: Container(decoration: BoxDecoration(color: AppColors.primaryMain, borderRadius: BorderRadius.circular(3))),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(bottomLabel, style: AppTextStyles.ptdBold(18)),
        Text(bottomSub, style: AppTextStyles.ptdRegular(12)),
      ],
    );
  }
}

class _ClosetStatCard extends StatelessWidget {
  final String title;
  final int count;

  const _ClosetStatCard({required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.ptdBold(13)),

          const SizedBox(height: 12),

          Text('$count벌', style: AppTextStyles.ptdBold(26)),
        ],
      ),
    );
  }
}