import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ttobaba/core/widgets/app_backbar.dart';
import 'package:ttobaba/core/widgets/app_button.dart';
import 'package:ttobaba/core/widgets/app_text_field.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';
import '../widgets/profile_image_grid.dart';

class ProfileEditScreen extends ConsumerStatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  ConsumerState<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends ConsumerState<ProfileEditScreen> {
  late TextEditingController _nicknameController;
  int _selectedImageIndex = 0; // 기본값

  @override
  void initState() {
    super.initState();
    _nicknameController = TextEditingController();

    // 초기값 설정
    final user = ref.read(userProvider).value;
    if (user != null) {
      _nicknameController.text = user.nickname;
      // TODO: user.profileImg (String)를 index로 변환하는 로직이 필요하다면 추가
      // 현재는 기본값 0 또는 저장된 값이 있다면 그것을 매핑해야 함.
      // 만약 profileImg가 'assets/images/home_love_cat.png' 형태라면,
      // ProfileImageGrid의 리스트에서 인덱스를 찾아야 함.
    }
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  void _onSave() async {
    final nickname = _nicknameController.text.trim();
    if (nickname.isEmpty) return;

    // TODO: 실제 이미지 경로 매핑
    // ProfileImageGrid에 있는 리스트와 동일한 리스트를 참조해야 정확함.
    // 임시로 하드코딩된 리스트를 사용한다고 가정.
    final List<String> profileImages = [
      'assets/images/home_love_cat.png',
      // ... (Grid와 동일해야 함)
    ];
    String? selectedImg;
    if (_selectedImageIndex >= 0 && _selectedImageIndex < 12) {
      // 12는 예시
      // selectedImg = profileImages[_selectedImageIndex];
      // 서버가 'path'를 원하는지 'index'를 원하는지, 'url'을 원하는지 확인 필요.
      // 일단 String으로 보냄.
      selectedImg = "assets/images/home_love_cat.png"; // 임시
    }

    try {
      await ref.read(userProvider.notifier).updateProfile(
            ProfileUpdateRequest(
              nickname: nickname,
              profileImg: selectedImg,
            ),
          );
      if (mounted) {
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('프로필 수정 실패: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const isImageSelected = true; // 항상 선택된 상태로 간주 (기본값이 있으므로)

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBackBar(
        title: '프로필 설정',
        onBackPressed: () => context.pop(),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: Divider(
            height: 1,
            thickness: 1,
            color: AppColors.lightGrey,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('이름을 바꿀래요?',
                style: AppTextStyles.ptdBold(20).copyWith(height: 1.0)),
            const SizedBox(height: 14),
            AppTextField(
              hint: '바꿀 이름을 입력해 주세요',
              controller: _nicknameController,
              onChanged: (val) => setState(() {}),
            ),
            const SizedBox(height: 24),
            AppButton(
              text: '이거로 할래요',
              onPressed: _nicknameController.text.isNotEmpty ? _onSave : null,
              textStyle: AppTextStyles.ptdBold(16),
              borderRadius: 4,
            ),
            const SizedBox(height: 80),
            Text('프사를 바꿀래요?', style: AppTextStyles.ptdBold(20)),
            const SizedBox(height: 16),
            ProfileImageGrid(
              selectedImageIndex: _selectedImageIndex,
              onImageSelected: (index) {
                setState(() {
                  _selectedImageIndex = index;
                });
              },
            ),
            const SizedBox(height: 24),
            AppButton(
              text: '이거로 할래요',
              backgroundColor:
                  isImageSelected ? AppColors.primaryMain : AppColors.paleGrey,
              textColor: isImageSelected ? Colors.white : Colors.grey,
              onPressed: _nicknameController.text.isNotEmpty ? _onSave : null,
              textStyle: AppTextStyles.ptdBold(16),
              borderRadius: 4,
            )
          ],
        ),
      ),
    );
  }
}
