import 'package:flutter/material.dart';
// 👈 HomeScreen이 위치한 실제 경로로 수정하세요.
import 'package:ttobaba/features/home/screens/home_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // 디버그 배너를 숨기고 HomeScreen을 첫 화면으로 설정합니다. [cite: 2026-02-13]
      debugShowCheckedModeBanner: false, 
      home: HomeScreen(),
    );
  }
}