import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/widgets/app_topbar.dart'; 
// 👈 파일명과 일치하게 tab으로 임포트 [cite: 2026-02-13]
import 'package:ttobaba/features/home/widgets/home_tabbar.dart'; 
import 'package:ttobaba/features/chat/widgets/chat_item.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeTestBench(),
  ));
}

class HomeTestBench extends StatelessWidget {
  const HomeTestBench({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppTopbar(), 
      body: SafeArea(
        child: Column(
          children: [
            // 👈 클래스 이름을 HomeTabBar로 호출해야 에러가 안 납니다 [cite: 2026-02-13]
            HomeTabBar(), 
            
            const Divider(height: 1, thickness: 1, color: AppColors.paleGrey),
            
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: 3,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return const ChatItem(status: ItemStatus.considering);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}