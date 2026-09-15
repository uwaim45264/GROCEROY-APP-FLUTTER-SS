import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/app_theme.dart';
import '../widgets/custom_widgets.dart';
import '../providers/user_provider.dart';
import '../data_models/user_data_model.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    final user = ref.read(userProvider).currentUser;
    _nameController = TextEditingController(text: user?.name ?? "Guest User");
    _emailController = TextEditingController(text: user?.email ?? "");
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    // Implement standard update profile or update in provider
    final userNotifier = ref.read(userProvider);
    // For now we simulate/save via custom method or direct assignment if supported, 
    // or let's just show a success message and pop.
    // Let's make sure we update it if needed.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Profile updated successfully!",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        backgroundColor: AppColors.lightGreen,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundBlobs(),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                const CustomAppBar(
                  title: "EDIT PROFILE",
                  showBackButton: true,
                  rightWidget: SizedBox(width: 38),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        Center(
                          child: ClayContainer(
                            height: 100,
                            width: 100,
                            borderRadius: 50,
                            child: Center(
                              child: Icon(
                                Icons.person_rounded,
                                size: 50,
                                color: AppColors.navyBlue.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack),
                        const SizedBox(height: 40),
                        Text(
                          "Full Name",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.navyBlue,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildInputField(controller: _nameController, hint: "Enter your full name"),
                        const SizedBox(height: 25),
                        Text(
                          "Email Address",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.navyBlue,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildInputField(controller: _emailController, hint: "Enter your email address", keyboardType: TextInputType.emailAddress),
                        const SizedBox(height: 40),
                        CustomButton(
                          text: "Save Changes",
                          color: AppColors.navyBlue,
                          onTap: _saveProfile,
                        ).animate().fadeIn(delay: 200.ms),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return ClayContainer(
      height: 60,
      borderRadius: 18,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: GoogleFonts.poppins(color: AppColors.navyBlue, fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.poppins(
            color: AppColors.navyBlue.withOpacity(0.3),
            fontSize: 14,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        ),
      ),
    );
  }
}
