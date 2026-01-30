import 'package:flutter/material.dart';
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
          // Logo placeholder small
          const Center(
            child: Icon(
              Icons.restaurant_menu,
              color: AppColors.primary,
              size: 40,
            ),
          ),
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
          ),
          const SizedBox(height: 40),
          Text('What is your name?', style: AppTextStyles.heading),
          const SizedBox(height: 12),
          Text(
            'To personalize your kitchen experience.',
            style: AppTextStyles.subHeading,
          ),
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
          ),
          const Spacer(),
          PrimaryButton(
            text: 'Next',
            onPressed: widget.onNext,
            fullWidth: true,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
