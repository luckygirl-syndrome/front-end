import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppBackBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title; // 💡 텍스트를 담을 변수 추가
  final int? currentPage;
  final VoidCallback onBackPressed;
  final PreferredSizeWidget? bottom; // 💡 1. bottom 필드 추가

  const AppBackBar({
    super.key,
    this.currentPage,
    this.title, // 💡 선택사항으로 두면 텍스트 없는 페이지에서도 쓸 수 있어요.
    required this.onBackPressed,
    this.bottom, // 💡 2. 생성자에 추가
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: title != null 
        ? Text(title!, style: AppTextStyles.ptdBold(20)) 
        : null,
      leading: Container(
        // 2. 왼쪽 여백을 32로 고정합니다.
        margin: const EdgeInsets.only(left: 32), 
        alignment: Alignment.centerLeft,
        child: InkWell(
          // IconButton 대신 InkWell을 쓰면 기본 패딩 없이 위치를 잡기 더 편합니다.
          onTap: onBackPressed,
          child: const Icon(
            Icons.arrow_back_ios_new, 
            size: 20, 
            color: AppColors.black
          ),
        ),
      ),
      // 💡 3. AppBar의 bottom 속성에 연결
      bottom: bottom,
    );
  }

  @override
  // 💡 4. bottom의 높이만큼 앱바 전체 높이가 자동으로 계산되도록 수정
  Size get preferredSize => Size.fromHeight(
    kToolbarHeight + (bottom?.preferredSize.height ?? 0),
  );
}