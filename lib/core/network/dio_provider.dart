import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Secure Storage Provider
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

// 1. 기본 Dio 설정 (BaseOptions)
final dioProvider = Provider<Dio>((ref) {
  final storage = ref.watch(secureStorageProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl: "http://18.118.233.127:8001", // API Base URL
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: 'application/json',
    ),
  );

  // 2. 인터셉터 추가 (로그, 에러 처리, 토큰 주입 등)
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      // SecureStorage에서 토큰을 꺼내와 헤더에 주입
      final token = await storage.read(key: 'access_token');
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      print("🚀 [Token] ${token != null ? 'Present' : 'Missing'}");
      print("🚀 [REQ] ${options.method} ${options.path}");
      return handler.next(options);
    },
    onResponse: (response, handler) {
      print("✅ [RES] ${response.statusCode} ${response.requestOptions.path}");
      return handler.next(response);
    },
    onError: (DioException e, handler) {
      print("❌ [ERR] ${e.response?.statusCode} ${e.requestOptions.path}");
      print("❌ [ERR MSG] ${e.message}");
      print("❌ [ERR DATA] ${e.response?.data}");
      return handler.next(e);
    },
  ));

  return dio;
});
