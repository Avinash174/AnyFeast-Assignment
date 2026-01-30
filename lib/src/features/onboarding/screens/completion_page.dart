import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
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
          // We can add a close button at top right if needed, but the design shows it (Page 4)
          // However, inside PageView, appbar handles it or we do it here.
          // The design shows an X at top right, so maybe this page handles its own safe area/header?
          // Current architecture has AppBar in OnboardingScreen.
          // Let's assume OnboardingScreen hides AppBar for this page or we handle it.
          // In OnboardingScreen, I hid title/actions for index 3.
          const Spacer(),
          AvatarGlow(
            glowColor: AppColors.primary,
            glowRadiusFactor: 0.4,
            duration: const Duration(milliseconds: 2000),
            repeat: true,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFFEBEE), // Light red bg
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
          const SizedBox(height: 32),
          Text("You're all set!", style: AppTextStyles.heading),
          const SizedBox(height: 16),
          Text(
            'Your personalized meal plan is ready.',
            style: AppTextStyles.subHeading,
            textAlign: TextAlign.center,
          ),
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
                    color: Colors.grey[200], // Placeholder for image
                    // If we had image asset: Image.asset(...)
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
          ),
          const Spacer(),
          PrimaryButton(
            text: 'Go to Dashboard',
            onPressed: () {
              // Navigate to main app
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
