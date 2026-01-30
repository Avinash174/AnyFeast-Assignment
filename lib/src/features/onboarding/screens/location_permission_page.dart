import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:avatar_glow/avatar_glow.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../widgets/primary_button.dart';

class LocationPermissionPage extends StatelessWidget {
  final VoidCallback onNext;

  const LocationPermissionPage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Spacer(),

          SizedBox(
            height: 200,
            width: 200,
            child: AvatarGlow(
              startDelay: const Duration(milliseconds: 1000),
              glowColor: AppColors.primary,
              glowShape: BoxShape.circle,
              curve: Curves.fastOutSlowIn,
              child: Material(
                elevation: 8.0,
                shape: const CircleBorder(),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
            ),
          ).animate().scale(duration: 600.ms, curve: Curves.elasticOut),

          const SizedBox(height: 40),
          Text(
            'Find fresh, local\ningredients.',
            style: AppTextStyles.heading,
            textAlign: TextAlign.center,
          ).animate().fade().slideY(begin: 0.5, end: 0),

          const SizedBox(height: 16),
          Text(
            'Knowing your location helps us find seasonal recipes and ingredients nearby.',
            style: AppTextStyles.subHeading,
            textAlign: TextAlign.center,
          ).animate().fade(delay: 200.ms).slideY(begin: 0.5, end: 0),

          const Spacer(),
          PrimaryButton(
            text: 'Enable Location',
            onPressed: () {
              onNext();
            },
          ).animate().fade(delay: 400.ms).slideY(begin: 1, end: 0),

          const SizedBox(height: 16),
          TextButton(
            onPressed: onNext,
            child: Text(
              'Enter manually',
              style: AppTextStyles.subHeading.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ).animate().fade(delay: 600.ms),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
