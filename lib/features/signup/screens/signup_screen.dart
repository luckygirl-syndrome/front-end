import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// 1. 공통 위젯들
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/app_button.dart';
import '../widgets/signup_guide_item.dart'; // 방금 만든 가이드 아이템

// 2. 테마 및 스타일
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

// 3. 방금 만든 프로바이더
import '../providers/signup_provider.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});
  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> _pageData = [
    {'title': '어떻게 부르면 될까요?', 'subTitle': null, 'hint': '이름을 입력해 주세요', 'guides': []},
    {'title': '멋진 이메일을 입력해 주세요', 'subTitle': null, 'hint': '이메일을 입력해 주세요', 'guides': ['올바른 이메일 형식을 입력해 주세요', '@ 앞부분은 영어와 숫자로 이루어진 8~16자로 입력해 주세요']},
    {'title': '은밀한 비밀번호를\n입력해 주세요', 'subTitle': '또바바는 보안을 자랑합니다', 'hint': '비밀번호를 입력해 주세요', 'guides': ['8~16자로 입력해 주세요', '영어와 숫자로만 입력해 주세요']},
    {'title': '은밀한 비밀번호를\n한 번 더 입력해 주세요', 'subTitle': '또바바는 보안을 자랑합니다', 'hint': '비밀번호를 한 번 더 입력해 주세요', 'guides': ['동일한 비밀번호를 입력해 주세요']},
  ];

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signupProvider); // 상태 읽기
    final notifier = ref.read(signupProvider.notifier); // 로직 접근

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(context, state.currentPage),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox(height: 31),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: notifier.setPage,
                  itemCount: _pageData.length,
                  itemBuilder: (context, index) => _buildPageContent(index, state, notifier),
                ),
              ),
              _buildFooter(state, notifier),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageContent(int index, SignupState state, SignupNotifier notifier) {
    final data = _pageData[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(data['title']!, style: AppTextStyles.ptdBold(24).copyWith(color: AppColors.black)),
        if (data['subTitle'] != null) ...[
          const SizedBox(height: 8),
          Text(data['subTitle']!, style: AppTextStyles.ptdRegular(12).copyWith(color: AppColors.lightGrey)),
        ],
        const SizedBox(height: 78),
        AppTextField(
          controller: state.controllers[index],
          hint: data['hint']!,
          obscureText: index >= 2,
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
          onSubmitted: (_) => _handleNext(state, notifier),
        ),
        const SizedBox(height: 16),
        ...List<String>.from(data['guides'] ?? []).asMap().entries.map((e) => 
          SignupGuideItem(text: e.value, isValid: notifier.isGuideValid(index, e.key))
        ),
      ],
    );
  }

  void _handleNext(SignupState state, SignupNotifier notifier) {
    if (notifier.isPageValid(_pageData)) {
      if (state.currentPage < 3) {
        _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
        FocusScope.of(context).unfocus();
      } else { /* 가입 로직 */ }
    }
  }

  Widget _buildFooter(SignupState state, SignupNotifier notifier) {
    // 현재 페이지가 유효한지 미리 변수에 담아두면 깔끔합니다.
    final bool isPageValid = notifier.isPageValid(_pageData);

    return Column(children: [
      AppButton(
        text: state.currentPage == 3 ? '가보자고~!' : '다음',
        // ⭐ null 대신 () {} 를 주면 버튼 색이 변하지 않습니다.
        onPressed: isPageValid 
            ? () => _handleNext(state, notifier) 
            : () {}, // 조건이 안 맞을 땐 눌러도 반응만 없을 뿐, 색은 그대로!
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: List.generate(4, (i) => _buildDot(i, state.currentPage)),
      ),
    ]);
  }

  Widget _buildDot(int index, int current) => Container(
    width: 8, height: 8, margin: const EdgeInsets.symmetric(horizontal: 4),
    decoration: BoxDecoration(shape: BoxShape.circle, color: current == index ? AppColors.black : AppColors.lightGrey),
  );

  AppBar _buildAppBar(context, int current) => AppBar(
    backgroundColor: AppColors.white, elevation: 0,
    leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new, size: 20),
      onPressed: () => current > 0 ? _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut) : GoRouter.of(context).pop()),
  );
}