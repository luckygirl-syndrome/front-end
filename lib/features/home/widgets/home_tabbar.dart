import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';

class HomeTabBar extends StatefulWidget {
  HomeTabBar({super.key});

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 24, right: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildTabItem('또바와 진대', 0),
                const SizedBox(width: 28),
                _buildTabItem('결정했나요?', 1),
                const SizedBox(width: 28),
                _buildTabItem('안 산 영수증', 2),
              ],
            ),
          ),
          // 👈 하단 회색 선과 인디케이터 사이의 여백을 전산학적으로 0으로 고정 [cite: 2026-02-13]
          const Divider(height: 1, thickness: 1, color: AppColors.paleGrey),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        if (_selectedIndex != index) {
          setState(() => _selectedIndex = index);
        }
      },
      child: IntrinsicWidth( // 👈 텍스트 크기만큼 너비를 명백히 제한 [cite: 2026-01-02, 2026-02-13]
        child: Column(
          children: [
            Text(
              title,
              style: AppTextStyles.ptdBold(18).copyWith(
                color: isSelected ? AppColors.black : AppColors.lightGrey,
              ),
            ),
            const SizedBox(height: 12), // 텍스트와 선 사이 간격
            // 인디케이터: Divider 바로 위에 붙도록 설정 [cite: 2026-02-13]
            Container(
              height: 3,
              // 선택된 경우에만 텍스트 너비(IntrinsicWidth)를 100% 채움 [cite: 2026-02-13]
              width: isSelected ? double.infinity : 0, 
              color: isSelected ? AppColors.black : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}