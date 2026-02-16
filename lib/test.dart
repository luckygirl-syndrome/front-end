import 'package:flutter/material.dart';
// ChatListScreen이 정의된 파일의 실제 경로를 입력하세요.
// 예: 'package:ttobaba/features/chat/screens/chat_list_screen.dart'
import 'package:ttobaba/features/chat/screens/chat_list_screen.dart'; 

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChatListScreen(),
  ));
}