import 'package:flutter/material.dart';
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
          // Location Icon Ring Animation Placeholder
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red.withValues(alpha: 0.1)),
                ),
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red.withValues(alpha: 0.2)),
                ),
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
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            'Find fresh, local\ningredients.',
            style: AppTextStyles.heading,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Knowing your location helps us find seasonal recipes and ingredients nearby.',
            style: AppTextStyles.subHeading,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          PrimaryButton(
            text: 'Enable Location',
            onPressed: () {
              // Logic to request permission would go here
              onNext();
            },
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: onNext,
            child: Text(
              'Enter manually',
              style: AppTextStyles.subHeading.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
