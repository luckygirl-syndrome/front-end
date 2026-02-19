import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ttobaba/core/network/dio_provider.dart';
import 'package:ttobaba/core/theme/app_colors.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    // 1. 약간의 지연 (스플래시 노출)
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // 2. 토큰 확인
    final storage = ref.read(secureStorageProvider);
    final token = await storage.read(key: 'access_token');

    // 3. 이동
    if (token != null && token.isNotEmpty) {
      context.go('/home');
    } else {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryMain, // 브랜드 컬러
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 로고 이미지 (있는 경우)
            Image.asset(
              'assets/images/logo.png', // 로고 파일이 있다면 사용
              width: 120,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.flash_on, size: 80, color: Colors.white),
            ),
            const SizedBox(height: 20),
            // const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
