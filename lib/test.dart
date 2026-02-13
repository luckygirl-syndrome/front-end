import 'package:flutter/material.dart';
// 👈 ChatItem의 실제 경로를 명백히 확인하세요.
import 'package:ttobaba/features/auth/widgets/chat_item.dart'; 

void main() {
  runApp(const ChatItemTestApp());
}

class ChatItemTestApp extends StatelessWidget {
  const ChatItemTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // 배경색을 흰색으로 두어 아이템 경계를 명백히 확인
        backgroundColor: const Color(0xFFF5F5F5), 
        appBar: AppBar(
          title: const Text('ChatItem 단독 테스트'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            // 👈 테스트할 위젯 배치
            child: ChatItem(), 
          ),
        ),
      ),
    );
  }
}