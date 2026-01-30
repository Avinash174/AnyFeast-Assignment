import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../widgets/primary_button.dart';

class NameInputPage extends StatefulWidget {
  final VoidCallback onNext;

  const NameInputPage({super.key, required this.onNext});

  @override
  State<NameInputPage> createState() => _NameInputPageState();
}

class _NameInputPageState extends State<NameInputPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Icon(Icons.restaurant, color: AppColors.primary, size: 40),
          ).animate().fade().scale(duration: 400.ms, curve: Curves.easeOutBack),
          const SizedBox(height: 8),
          Center(
            child: Text(
              'ANYFEAST',
              style: AppTextStyles.cardSubtitle.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
                letterSpacing: 1.5,
              ),
            ),
          ).animate().fade().slideY(begin: 0.5, end: 0),

          const SizedBox(height: 40),
          Text(
            'What is your name?',
            style: AppTextStyles.heading,
          ).animate().fade(delay: 200.ms).slideX(begin: -0.2, end: 0),
          const SizedBox(height: 12),
          Text(
            'To personalize your kitchen experience.',
            style: AppTextStyles.subHeading,
          ).animate().fade(delay: 300.ms).slideX(begin: -0.2, end: 0),

          const SizedBox(height: 48),
          TextField(
            controller: _controller,
            style: const TextStyle(fontSize: 24),
            decoration: InputDecoration(
              hintText: 'Your name',
              hintStyle: TextStyle(color: Colors.grey.withValues(alpha: 0.5)),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary),
              ),
            ),
          ).animate().fade(delay: 400.ms).slideY(begin: 0.5, end: 0),

          const Spacer(),
          PrimaryButton(
            text: 'Next',
            onPressed: widget.onNext,
            fullWidth: true,
          ).animate().fade(delay: 600.ms).slideY(begin: 1, end: 0),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
