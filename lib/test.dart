import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/features/home/widgets/nobuyreceipt/nobuy_receipt.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // 👈 시안(image_b9825f.jpg)과 동일한 어두운 배경색 적용 [cite: 2026-02-13]
        backgroundColor: const Color(0xFF1C1C1C), 
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 👈 제작한 영수증 카드 위젯 호출 [cite: 2026-02-13]
              const ReceiptCard(), 
              const SizedBox(height: 20),
              Text(
                "Receipt Card Test (240x394)",
                style: TextStyle(color: Colors.white.withOpacity(0.5)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}