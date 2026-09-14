import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcome_screen.dart';
import '../widgets/app_theme.dart';
import '../widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "title1": "Goodness",
      "title2": "Delivered Daily",
      "description": "Fresh milk & daily essentials delivered to your doorstep every single day.",
      "image": "assets/onborading images/4.png",
    },
    {
      "title1": "Fresh Essentials,",
      "title2": "Happy Life",
      "description": "From farm-fresh milk to your favorite groceries — everything you need, we deliver.",
      "image": "assets/onborading images/5.png",
    },
    {
      "title1": "Your Daily Routine,",
      "title2": "Simplified",
      "description": "Subscribe, relax and let us take care of the rest. Freshness, Savings & Convenience – all in one app.",
      "image": "assets/onborading images/6.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Skip Button
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (c) => const WelcomeScreen()),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Skip",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Page Content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _onboardingData[index]["title1"]!,
                            style: GoogleFonts.poppins(
                              fontSize: 34,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                              height: 1.1,
                            ),
                          ),
                          Text(
                            _onboardingData[index]["title2"]!,
                            style: GoogleFonts.poppins(
                              fontSize: 34,
                              fontWeight: FontWeight.w700,
                              color: AppColors.navyBlue,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            _onboardingData[index]["description"]!,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: AppColors.grey,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 10,
                      child: Image.asset(
                        _onboardingData[index]["image"]!,
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom Action
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: _currentPage == 2
                  ? CustomButton(
                      text: "Let's Get Started",
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (c) => const WelcomeScreen()),
                      ),
                      color: AppColors.navyBlue,
                      icon: Icons.arrow_forward_rounded,
                      height: 60,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _onboardingData.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(right: 8),
                          height: 8,
                          width: _currentPage == index ? 24 : 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? AppColors.navyBlue
                                : AppColors.navyBlue,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
