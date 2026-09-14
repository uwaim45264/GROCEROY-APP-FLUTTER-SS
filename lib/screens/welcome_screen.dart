import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/custom_widgets.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import '../widgets/app_theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          const BackgroundBlobs(),
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 2),

                Center(
                  child: ClayContainer(
                    height: 280,
                    width: 280,
                    borderRadius: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Image.asset(
                        'assets/onborading images/4.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ).animate().fadeIn(duration: 800.ms).scale(delay: 200.ms),
                const Spacer(),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      Text(
                        "Hey Fresh Finder,\nWelcome to GroceryGo",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.navyBlue,
                          height: 1.2,
                        ),
                      ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2, end: 0),
                      const SizedBox(height: 15),
                      Text(
                        "Sourcing the highest grade organic produce from local agricultural hubs directly to you.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: AppColors.navyBlue.withOpacity(0.6),
                          height: 1.5,
                        ),
                      ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2, end: 0),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
                

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: index == 0 ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: index == 0 ? AppColors.navyBlue : AppColors.navyBlue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  )),
                ).animate().fadeIn(delay: 700.ms),
                
                const Spacer(flex: 2),
                

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                  child: ClayContainer(
                    height: 65,
                    borderRadius: 20,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const SignupScreen())),
                            child: Container(
                              margin: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.navyBlue.withOpacity(0.05),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  )
                                ]
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "Sign Up", 
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600, 
                                  color: AppColors.navyBlue,
                                )
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const LoginScreen())),
                            child: Container(
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Text(
                                "Login", 
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600, 
                                  color: AppColors.navyBlue.withOpacity(0.5),
                                )
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.5, end: 0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
