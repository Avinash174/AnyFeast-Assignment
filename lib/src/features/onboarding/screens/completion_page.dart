import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../widgets/primary_button.dart';

class CompletionPage extends StatelessWidget {
  const CompletionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Spacer(),
          // Wrap AvatarGlow in a widget to ensure valid animate chain
          SizedBox(
            child: AvatarGlow(
              glowColor: AppColors.primary,
              glowRadiusFactor: 0.4,
              duration: const Duration(milliseconds: 2000),
              repeat: true,
              child: Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFEBEE), // Light red bg
                ),
                padding: const EdgeInsets.all(24),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 40),
                ),
              ),
            ),
          ).animate().scale(duration: 600.ms, curve: Curves.easeOutBack),
          const SizedBox(height: 32),
          Text(
            "You're all set!",
            style: AppTextStyles.heading,
          ).animate().fade(delay: 300.ms).slideY(begin: 0.5, end: 0),
          const SizedBox(height: 16),
          Text(
            'Your personalized meal plan is ready.',
            style: AppTextStyles.subHeading,
            textAlign: TextAlign.center,
          ).animate().fade(delay: 400.ms).slideY(begin: 0.5, end: 0),
          const SizedBox(height: 32),
          // Meal card preview
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.grey[200], // Placeholder
                    child: const Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "TODAY'S DINNER",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Glazed Salmon B...",
                            style: AppTextStyles.cardTitle,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.restaurant,
                          color: AppColors.primary,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ).animate().fade(delay: 600.ms).slideY(begin: 0.2, end: 0),
          const Spacer(),
          PrimaryButton(
            text: 'Go to Dashboard',
            onPressed: () {
              // Navigate to main app
            },
          ).animate().fade(delay: 800.ms).slideY(begin: 1, end: 0),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
