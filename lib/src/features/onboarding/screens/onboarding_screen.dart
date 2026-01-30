import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../widgets/onboarding_page_indicator.dart';
import 'dietary_preferences_page.dart';
import 'location_permission_page.dart';
import 'name_input_page.dart';
import 'completion_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _skip() {
    // Navigate to Completion or Dashboard directly
    // For now, let's jump to the last page or handled per page
    _pageController.jumpToPage(3); // Jump to Completion
  }

  @override
  Widget build(BuildContext context) {
    // We will conditionally show AppBar based on the page or handle it inside each page.
    // However, to keep the Indicator persistent, we might want it here?
    // The designs show the indicator at the top.

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: _currentPage > 0
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.textPrimary,
                  size: 20,
                ),
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              )
            : null,
        title: _currentPage < 3
            ? Center(
                // Hide indicator on completion page
                child: OnboardingPageIndicator(
                  controller: _pageController,
                  count:
                      4, // Dietary, Location, Name, (Completion handles its own or separate)
                  // Let's assume 3 steps then completion.
                  // 0: Dietary
                  // 1: Location
                  // 2: Name
                  // 3: Completion (No indicator?)
                ),
              )
            : null,
        actions: [
          if (_currentPage < 3)
            TextButton(
              onPressed: _skip,
              child: const Text(
                'Skip',
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ),
          if (_currentPage >= 3) const SizedBox(width: 48), // Balancing space
        ],
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics:
              const NeverScrollableScrollPhysics(), // Disable swipe to enforce usage of buttons
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          children: [
            DietaryPreferencesPage(onNext: _nextPage),
            LocationPermissionPage(onNext: _nextPage),
            NameInputPage(onNext: _nextPage),
            const CompletionPage(),
          ],
        ),
      ),
    );
  }
}
