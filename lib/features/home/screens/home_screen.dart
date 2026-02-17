import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/widgets/app_topbar.dart';
import 'package:ttobaba/core/widgets/app_navbar.dart';
import 'package:ttobaba/features/home/widgets/common/home_tabbar.dart';
import 'package:ttobaba/features/home/widgets/ttobaba/home_ttobaba_section.dart';
import 'package:ttobaba/features/home/widgets/decision/home_decision_section.dart';
import 'package:ttobaba/features/home/widgets/nobuy_receipt/simple_nobuy_receipt_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 1;
  int _currentTopTabIndex = 0;

  bool _showReviewWidget = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // 1. 본문 영역: Column 내부에서 위젯들을 순서대로 쌓습니다. [cite: 2026-02-13]
      body: SafeArea(
        child: Column(
          children: [
            const AppTopbar(), // 최상단 로고바 [cite: 2026-02-13]

            // 2. 테스트용 토글 스위치 (개발 완료 후 제거 가능) [cite: 2026-02-13]
            Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("🔔 평가 알림 위젯 보기 (Test)", style: TextStyle(fontSize: 12)),
                  Transform.scale(
                    scale: 0.8, // 스위치 크기 약간 축소 [cite: 2026-01-02]
                    child: Switch(
                      value: _showReviewWidget,
                      activeColor: const Color(0xFFFFD56C),
                      onChanged: (value) {
                        setState(() {
                          _showReviewWidget = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            HomeTabBar(
              currentIndex: _currentTopTabIndex,
              onTabChanged: (index) {
                setState(() => _currentTopTabIndex = index);
              },
            ),
            
            // 2. 가변 영역: Expanded를 써야 남은 공간을 다 차지하며 내용이 보입니다. [cite: 2026-02-13]
            Expanded(
              child: _buildTabContent(),
            ),
          ],
        ),
      ),
      // 3. 네비게이션 바: body와 별개로 최하단에 명백히 고정됩니다. [cite: 2026-02-13]
      bottomNavigationBar: AppNavbar(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() => _currentNavIndex = index);
        },
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_currentTopTabIndex) {
      case 0:
        return HomeTtobabaSection(showReviewWidget: _showReviewWidget);
      case 1:
        return const HomeDecisionSection(); 
      case 2:
        return const SimpleNobuyReceiptSection();
      default:
        return HomeTtobabaSection(showReviewWidget: _showReviewWidget);
    }
  }
}