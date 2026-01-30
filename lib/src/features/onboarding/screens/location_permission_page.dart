import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
          // Location Icon Ring Animation
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.red.withValues(alpha: 0.1),
                      ),
                    ),
                  )
                  .animate(onPlay: (controller) => controller.repeat())
                  .scale(
                    duration: 2000.ms,
                    begin: const Offset(0.8, 0.8),
                    end: const Offset(1.2, 1.2),
                  )
                  .fadeIn(duration: 1000.ms)
                  .fadeOut(delay: 1000.ms, duration: 1000.ms),

              Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.red.withValues(alpha: 0.2),
                      ),
                    ),
                  )
                  .animate(
                    onPlay: (controller) => controller.repeat(reverse: true),
                  )
                  .scale(
                    duration: 1500.ms,
                    begin: const Offset(0.9, 0.9),
                    end: const Offset(1.1, 1.1),
                  ),

              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: const Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 40,
                ),
              ).animate().scale(duration: 600.ms, curve: Curves.elasticOut),
            ],
          ),
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
