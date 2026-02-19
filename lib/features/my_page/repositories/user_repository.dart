import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/core/network/dio_provider.dart';
import 'package:ttobaba/features/my_page/models/user_model.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return UserRepository(dio);
});

class UserRepository {
  final Dio _dio;

  UserRepository(this._dio);

  Future<UserProfile> getProfile() async {
    try {
      final response = await _dio.get('/api/profile');
      return UserProfile.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateProfile(ProfileUpdateRequest request) async {
    try {
      await _dio.patch(
        '/api/setting/profile',
        data: request.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
