import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/app_button.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          /// Figma 수치는 16px이나, 아이콘 자체의 기본 여백(Internal Padding)으로 인해 
          // 시각적으로 작아 보여 20px로 보정함 (실제 화살표 크기를 피그마와 맞추기 위함)
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.black, size: 20),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 31),
              // 1. 타이틀 섹션
              Text(
                '어떻게 부르면 될까요?',
                style: AppTextStyles.ptdBold(24).copyWith(color: AppColors.black),
              ),
              const SizedBox(height: 48),

              // 2. 입력 섹션 (const 제거 필수!)
              AppTextField(
                hint: '이름을 입력해 주세요',
                textStyle: AppTextStyles.ptdRegular(16),
                // 내부 로직 덕분에 hintStyle은 안 넣어도 자동으로 lightGrey 적용됩니다!
              ),

              const Spacer(), // 버튼을 아래로 밀어줌

              // 3. 인디케이터 (페이지 점)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 0 ? AppColors.black : AppColors.lightGrey.withOpacity(0.5),
                  ),
                )),
              ),
              const SizedBox(height: 24),

              // 4. 다음 버튼
              AppButton(
                text: '다음',
                onPressed: () {
                  // 다음 단계 이동 로직
                },
                borderRadius: 12,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: AppTextStyles.ptdBold(18),
              ),
              const SizedBox(height: 20), // 하단 여백
            ],
          ),
        ),
      ),
    );
  }
}