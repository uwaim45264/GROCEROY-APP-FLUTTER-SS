import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import '../widgets/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryGreen,
          primary: AppColors.primaryGreen,
          secondary: AppColors.navyBlue,
        ),
        scaffoldBackgroundColor: AppColors.white,
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}
