import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/custom_widgets.dart';
import 'signup_screen.dart';
import 'dashboard_screen.dart';
import '../widgets/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  void _handleLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (c) => const DashboardScreen()),
    );
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
                  const SizedBox(height: 50),
                  Text(
                    "Hello fresh lover!",
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onBackground,
                      height: 1.2,
                    ),
                  ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
                  const SizedBox(height: 8),
                  Text(
                    "Welcome back, your fresh cart missed you!",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: colorScheme.onBackground.withOpacity(0.6),
                    ),
                  ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
                  const SizedBox(height: 50),
                  
                  _buildSoftField(
                    context: context,
                    hint: "Enter email identifier",
                  ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1, end: 0),
                  
                  const SizedBox(height: 20),
                  
                  _buildSoftField(
                    context: context,
                    hint: "Password",
                    isPassword: true,
                  ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1, end: 0),
                  
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: colorScheme.onBackground.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ).animate().fadeIn(delay: 500.ms),
                  
                  const SizedBox(height: 25),
                  
                  CustomButton(
                    text: "Login",
                    onTap: _handleLogin,
                    color: colorScheme.primary,
                  ).animate().fadeIn(delay: 600.ms).scale(),
                  
                  const SizedBox(height: 50),
                  
                  Center(
                    child: Text(
                      "Or continue with",
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
                  
                  const SizedBox(height: 60),
                  
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (c) => const SignupScreen()),
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: "Not a member? ",
                          style: GoogleFonts.poppins(
                            color: colorScheme.onBackground.withOpacity(0.6),
                            fontSize: 13,
                          ),
                          children: [
                            TextSpan(
                              text: "Register now",
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
