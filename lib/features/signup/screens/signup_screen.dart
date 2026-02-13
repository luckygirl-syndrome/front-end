import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/app_button.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // 1. 각 페이지별 입력값을 제어할 컨트롤러 리스트
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    // 페이지 개수만큼 컨트롤러 생성 및 리스너 등록
    _controllers = List.generate(
        4,
        (index) => TextEditingController()
          ..addListener(() {
            if (mounted) {
              setState(() {});
            } // 글자 입력 시마다 유효성 검사를 위해 화면 갱신
          }));
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  // 2. 유효성 검사 로직 (페이지 index와 가이드 문구 index를 받음)
  bool _isGuideValid(int pageIndex, int guideIndex) {
    String text = _controllers[pageIndex].text;

    if (pageIndex == 1 || pageIndex == 2) {
      // 아이디 & 비밀번호 페이지
      if (guideIndex == 0) return text.length >= 8 && text.length <= 16;
      if (guideIndex == 1)
        return RegExp(r'^(?=.*[A-Za-z])(?=.*\d)').hasMatch(text); // 영문+숫자 조합
    }

    if (pageIndex == 3) {
      // 비밀번호 확인 페이지
      return text.isNotEmpty && text == _controllers[2].text; // 이전 비번과 일치 여부
    }

    return false;
  }

  // 1. 부가적인 텍스트 데이터 구조화
  final List<Map<String, dynamic>> _pageData = [
    {
      'title': '어떻게 부르면 될까요?',
      'subTitle': null,
      'hint': '이름을 입력해 주세요',
      'guides': [],
    },
    {
      'title': '멋진 아이디를 입력해 주세요',
      'subTitle': null,
      'hint': '아이디를 입력해 주세요',
      'guides': ['8~16자로 입력해 주세요', '영어와 숫자로만 입력해 주세요'],
    },
    {
      'title': '은밀한 비밀번호를 입력해 주세요',
      'subTitle': '또바바는 업계 최고 수준의 보안을 자랑합니다',
      'hint': '비밀번호를 입력해 주세요',
      'guides': ['8~16자로 입력해 주세요', '영어와 숫자로만 입력해 주세요'],
    },
    {
      'title': '은밀한 비밀번호를\n한 번 더 입력해 주세요',
      'subTitle': '또바바는 업계 최고 수준의 보안을 자랑합니다',
      'hint': '비밀번호를 한 번 더 입력해 주세요',
      'guides': ['동일한 비밀번호를 입력해 주세요'],
    },
  ];

  // 1. 현재 페이지의 모든 조건이 충족되었는지 확인하는 로직 추가
  bool get _isPageValid {
    // 컨트롤러 초기화 전 에러 방지
    if (!mounted || _controllers.isEmpty) return false;

    // ⭐ 에러 발생 지점 수정: 안전하게 List<String>으로 복사
    final List<String> guides = List<String>.from(_pageData[_currentPage]['guides'] ?? []);

    // 가이드가 없는 페이지(닉네임)는 텍스트 입력 여부만 확인
    if (guides.isEmpty) {
      return _controllers[_currentPage].text.trim().isNotEmpty;
    }

    // 가이드가 있는 페이지는 모든 가이드가 isValid(true)인지 확인
    return List.generate(guides.length, (i) => _isGuideValid(_currentPage, i))
        .every((valid) => valid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox(height: 31),
              // 1. 유동적으로 변하는 본문 영역
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics:
                      const NeverScrollableScrollPhysics(), // 스와이프 방지 (버튼으로만 이동)
                  onPageChanged: (index) =>
                      setState(() => _currentPage = index),
                  itemCount: _pageData.length,
                  itemBuilder: (context, index) => _buildPageContent(index),
                ),
              ),
              // 2. 고정된 하단 영역 (인디케이터 + 버튼)
              _buildFooter(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageContent(int index) {
    final data = _pageData[index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 타이틀
        Text(data['title']!,
            style: AppTextStyles.ptdBold(24).copyWith(color: AppColors.black)),

        // 서브 타이틀 (있을 때만 렌더링)
        if (data['subTitle'] != null) ...[
          // height 8로해야 피그마 느낌남. 원래 하기로 했던 16-2-2(텍스트라) = 12로 하면 너무 멀다.
          const SizedBox(height: 8),
          Text(
            data['subTitle']!,
            style: AppTextStyles.ptdRegular(12)
                .copyWith(color: AppColors.lightGrey),
          ),
        ],

        const SizedBox(height: 78),

        // 입력창 (눈 아이콘은 AppTextField 내부 로직에 따라 추가 가능)
        AppTextField(
          controller: _controllers[index], // 컨트롤러 연결
          hint: data['hint']!,
          obscureText: index >= 2,
          textStyle: AppTextStyles.ptdRegular(16),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
        ),

        const SizedBox(height: 16),
        // 3. 가이드 문구 색상 변경 로직 적용
        ...(List<String>.from(data['guides'] ?? [])
            .asMap()
            .entries
            .map((entry) {
          int guideIdx = entry.key;
          String guideText = entry.value;

          // 유효성 검사 결과에 따른 색상 결정
          bool isValid = _isGuideValid(index, guideIdx);
          Color activeColor =
              isValid ? AppColors.primaryMain : AppColors.lightGrey;

          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Icon(Icons.check, size: 14, color: activeColor), // 체크 아이콘 색상 변경
                const SizedBox(width: 8),
                Text(
                  guideText,
                  style: AppTextStyles.ptdRegular(12)
                      .copyWith(color: activeColor), // 텍스트 색상 변경
                ),
              ],
            ),
          );
        }).toList()),
      ],
    );
  }

  Widget _buildFooter() {
    // 모든 조건 충족 시에만 동작하도록 설정
    final bool canProceed = _isPageValid;

    return Column(
      children: [
        AppButton(
          text: _currentPage == 3 ? '가보자고~!' : '다음',
          // canProceed가 true일 때만 함수() { ... }를 전달하고, false면 null을 전달합니다.
          onPressed: () {
            if (!canProceed) return; // 조건 안 맞으면 아무것도 안 함

            if (_currentPage < 3) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              FocusScope.of(context).unfocus();
            } else {
              // 가입 완료 로직
            }
          },
        ),
        const SizedBox(height: 20),
        // 인디케이터
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) => _buildDot(index)),
        ),
      ],
    );
  }

  Widget _buildDot(int index) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? AppColors.black : AppColors.lightGrey,
      ),
    );
  }

  AppBar _buildAppBar(context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new,
            color: AppColors.black, size: 20),
        onPressed: () {
          if (_currentPage > 0) {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          } else {
            context.pop();
          }
        },
      ),
    );
  }
}
