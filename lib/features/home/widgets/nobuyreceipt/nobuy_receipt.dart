import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';

class ReceiptCard extends StatelessWidget {
  final String title;
  final String price;
  final String discount;
  final String imageUrl;
  final Color backgroundColor;
  final Color shadowColor;

  const ReceiptCard({
    super.key,
    this.title = "여성 아이스제로 레이디 미들 다운자켓#2_LE",    // 제품 이름 [cite: 2026-01-02]
    this.price = "251,100원",    // 가격 [cite: 2026-01-02]
    this.discount = "37%", // 할인율 [cite: 2026-01-02]
    this.imageUrl = "assets/images/product_sample.png", // 사진 경로 [cite: 2026-01-02]
    this.backgroundColor = AppColors.primaryMain,
    this.shadowColor = AppColors.primaryMain,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cardWidth = screenWidth * (240 / 390);
    final double cardHeight = screenWidth * (394 / 390);
    
    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 16,
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        // 4. verticalArrangement = Arrangement.spacedBy(20.dp) [cite: 2026-02-13]
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(title),        // 타이틀
                const SizedBox(height: 12),
                _buildPriceTags(price, discount),     // 가격 (태그)
                const SizedBox(height: 12),
                _buildProductImage(imageUrl),  // 사진
              ],
            ),
          ),
        ],
      ),
    );
  }

  // "자세히 보기 >" 영역
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "자세히 보기",
          style: AppTextStyles.ptdMedium(12).copyWith(color: AppColors.white),
        ),
        Icon(Icons.chevron_right, size: 16, color: AppColors.white),
      ],
    );
  }

  // 👈 파라미터를 받도록 수정 [cite: 2026-01-02]
  Widget _buildTitle(String titleText) {
    return Text(
      titleText,
      style: AppTextStyles.ptdExtraBold(20).copyWith(color: AppColors.white, height: 1.2),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  // 👈 파라미터를 받도록 수정 [cite: 2026-01-02]
  Widget _buildPriceTags(String priceText, String discountText) {
    return Row(
      children: [
        _buildTag(priceText),
        const SizedBox(width: 8),
        _buildTag(discountText),
      ],
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: AppTextStyles.ptdBold(12).copyWith(color: AppColors.white),
      ),
    );
  }

  // 👈 파라미터를 받도록 수정 [cite: 2026-01-02]
  Widget _buildProductImage(String url) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          url,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}