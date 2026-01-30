import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../widgets/primary_button.dart';

class DietaryPreferencesPage extends StatefulWidget {
  final VoidCallback onNext;

  const DietaryPreferencesPage({super.key, required this.onNext});

  @override
  State<DietaryPreferencesPage> createState() => _DietaryPreferencesPageState();
}

class _DietaryPreferencesPageState extends State<DietaryPreferencesPage> {
  String _selectedPreference = 'Everything'; // Default

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Any dietary\npreferences?',
            style: AppTextStyles.heading,
          ).animate().fade().slideX(
            begin: -0.2,
            end: 0,
            duration: 400.ms,
            curve: Curves.easeOut,
          ),
          const SizedBox(height: 12),
          Text(
                'This helps us tailor your recipe discovery.',
                style: AppTextStyles.subHeading,
              )
              .animate()
              .fade(delay: 200.ms)
              .slideX(
                begin: -0.2,
                end: 0,
                duration: 400.ms,
                curve: Curves.easeOut,
              ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView(
              children:
                  [
                        _buildPreferenceCard(
                          'Vegan',
                          'Strictly plant-based',
                          Icons.eco,
                          AppColors.veganBg,
                          AppColors.veganIcon,
                        ),
                        const SizedBox(height: 16),
                        _buildPreferenceCard(
                          'Keto',
                          'High fat, low carb focus',
                          Icons.set_meal,
                          AppColors.ketoBg,
                          AppColors.ketoIcon,
                        ),
                        const SizedBox(height: 16),
                        _buildPreferenceCard(
                          'Everything',
                          'No specific restrictions',
                          Icons.restaurant,
                          AppColors.everythingBg,
                          AppColors.everythingIcon,
                        ),
                      ]
                      .animate(interval: 100.ms)
                      .fade()
                      .slideY(
                        begin: 0.5,
                        end: 0,
                        duration: 400.ms,
                        curve: Curves.easeOut,
                      ),
            ),
          ),
          PrimaryButton(
            text: 'Next',
            onPressed: widget.onNext,
          ).animate().fade(delay: 600.ms).slideY(begin: 1.0, end: 0.0),
        ],
      ),
    );
  }

  Widget _buildPreferenceCard(
    String title,
    String subtitle,
    IconData icon,
    Color bgColor,
    Color iconColor,
  ) {
    final isSelected = _selectedPreference == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPreference = title;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.selectedBorder : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? AppColors.primary.withValues(alpha: 0.1)
                  : Colors.black.withValues(alpha: 0.05),
              blurRadius: isSelected ? 15 : 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.cardTitle),
                  const SizedBox(height: 4),
                  Text(subtitle, style: AppTextStyles.cardSubtitle),
                ],
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: AppColors.selectedBorder,
                size: 24,
              ).animate().scale(duration: 200.ms, curve: Curves.easeOutBack),
          ],
        ),
      ),
    );
  }
}
