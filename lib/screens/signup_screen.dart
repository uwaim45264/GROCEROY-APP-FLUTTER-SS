import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/success_dialog.dart';
import 'login_screen.dart';
import '../widgets/app_theme.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscureText = true;

  void _handleSignup() {
    SuccessDialog.show(context);

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pop();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (c) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          const BackgroundBlobs(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const CustomAppBar(
                    showBackButton: true,
                    rightWidget: SizedBox.shrink(),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "Join the fresh club!",
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onBackground,
                      height: 1.2,
                    ),
                  ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
                  const SizedBox(height: 8),
                  Text(
                    "Create an account to start your organic journey today.",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: colorScheme.onBackground.withOpacity(0.6),
                    ),
                  ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
                  const SizedBox(height: 40),
                  
                  _buildSoftField(
                    context: context,
                    hint: "Full Name",
                  ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1, end: 0),
                  
                  const SizedBox(height: 18),
                  
                  _buildSoftField(
                    context: context,
                    hint: "Email Address",
                  ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1, end: 0),
                  
                  const SizedBox(height: 18),
                  
                  _buildSoftField(
                    context: context,
                    hint: "Password",
                    isPassword: true,
                  ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1, end: 0),
                  
                  const SizedBox(height: 30),
                  
                  CustomButton(
                    text: "Create Account",
                    onTap: _handleSignup,
                    color: colorScheme.primary,
                  ).animate().fadeIn(delay: 600.ms).scale(),
                  
                  const SizedBox(height: 40),
                  
                  Center(
                    child: Text(
                      "Or sign up with",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: colorScheme.onBackground.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ).animate().fadeIn(delay: 700.ms),
                  
                  const SizedBox(height: 25),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon(context, Icons.g_mobiledata_rounded),
                      const SizedBox(width: 25),
                      _buildSocialIcon(context, Icons.facebook_rounded),
                      const SizedBox(width: 25),
                      _buildSocialIcon(context, Icons.apple_rounded),
                    ],
                  ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.2, end: 0),
                  
                  const SizedBox(height: 50),
                  
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (c) => const LoginScreen()),
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: "Already a member? ",
                          style: GoogleFonts.poppins(
                            color: colorScheme.onBackground.withOpacity(0.6),
                            fontSize: 13,
                          ),
                          children: [
                            TextSpan(
                              text: "Login here",
                              style: GoogleFonts.poppins(
                                color: colorScheme.onBackground,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).animate().fadeIn(delay: 900.ms),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSoftField({required BuildContext context, required String hint, bool isPassword = false}) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return ClayContainer(
      height: 60,
      borderRadius: 18,
      color: colorScheme.surface,
      child: TextField(
        obscureText: isPassword && _obscureText,
        style: GoogleFonts.poppins(color: colorScheme.onSurface, fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.poppins(
            color: colorScheme.onSurface.withOpacity(0.3),
            fontSize: 14,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          suffixIcon: isPassword
              ? GestureDetector(
                  onTap: () => setState(() => _obscureText = !_obscureText),
                  child: Icon(
                    _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: colorScheme.onSurface.withOpacity(0.3),
                    size: 20,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildSocialIcon(BuildContext context, IconData icon) {
    final theme = Theme.of(context);
    return ClayContainer(
      height: 54,
      width: 54,
      borderRadius: 27,
      color: theme.colorScheme.surface,
      child: Icon(icon, color: theme.colorScheme.onSurface, size: 28),
    );
  }
}
