import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttobaba/features/home/repositories/home_repository.dart';
import 'package:ttobaba/core/network/dio_provider.dart';
import 'package:ttobaba/features/home/models/dashboard_model.dart';

part 'dashboard_provider.g.dart';

@riverpod
class Dashboard extends _$Dashboard {
  @override
  FutureOr<HomeDashboardData?> build() async {
    return _fetchDashboard();
  }

  Future<HomeDashboardData?> _fetchDashboard() async {
    final storage = ref.read(secureStorageProvider);
    final token = await storage.read(key: 'access_token');
    if (token == null) {
      debugPrint("❌ [Dashboard] No token found");
      return null;
    }

    try {
      final repository = ref.read(homeRepositoryProvider);
      final response = await repository.getHomeDashboard();

      debugPrint("✅ [Dashboard] Response: $response");
      // API response structure: { "id": 1, "data": { ... } }
      return HomeDashboardData.fromJson(response['data']);
    } catch (e, st) {
      debugPrint("❌ [Dashboard] Error: $e");
      debugPrint("❌ [Dashboard] Stack: $st");
      rethrow;
    }
  }
}
