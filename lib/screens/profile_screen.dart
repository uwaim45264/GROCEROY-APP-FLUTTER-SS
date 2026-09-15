import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/app_theme.dart';
import '../widgets/custom_widgets.dart';
import '../providers/user_provider.dart';
import 'welcome_screen.dart';
import 'orders_screen.dart';
import 'addresses_screen.dart';
import 'payments_screen.dart';
import 'notifications_screen.dart';
import 'help_support_screen.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundBlobs(),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                CustomAppBar(
                  title: "PROFILE",
                  showBackButton: true,
                  rightWidget: const SizedBox(width: 38),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        // Profile Image Section
                        Center(
                          child: Stack(
                            children: [
                              ClayContainer(
                                height: 120,
                                width: 120,
                                borderRadius: 60,
                                child: Center(
                                  child: Icon(
                                    Icons.person_rounded,
                                    size: 60,
                                    color: AppColors.navyBlue.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (c) => const EditProfileScreen()),
                                  ),
                                  child: const ClayContainer(
                                    height: 36,
                                    width: 36,
                                    borderRadius: 18,
                                    color: AppColors.lightGreen,
                                    child: Icon(
                                      Icons.edit_rounded,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack),
                        
                        const SizedBox(height: 25),
                        
                        Text(
                          user?.name ?? "Guest User",
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: AppColors.navyBlue,
                          ),
                        ).animate().fadeIn(delay: 200.ms),
                        
                        Text(
                          user?.email ?? "login to sync data",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColors.navyBlue.withOpacity(0.5),
                          ),
                        ).animate().fadeIn(delay: 300.ms),
                        
                        const SizedBox(height: 40),
                        
                        // Menu Options
                        _buildMenuOption(
                          icon: Icons.shopping_bag_outlined,
                          title: "My Orders",
                          subtitle: "Track your active orders",
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const OrdersScreen())),
                        ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.1, end: 0),
                        
                        _buildMenuOption(
                          icon: Icons.location_on_outlined,
                          title: "Delivery Address",
                          subtitle: "Home, Office & other saved places",
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const AddressesScreen())),
                        ).animate().fadeIn(delay: 500.ms).slideX(begin: 0.1, end: 0),
                        
                        _buildMenuOption(
                          icon: Icons.payment_outlined,
                          title: "Payment Methods",
                          subtitle: "Cards, Wallets & UPI",
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const PaymentsScreen())),
                        ).animate().fadeIn(delay: 600.ms).slideX(begin: 0.1, end: 0),
                        
                        _buildMenuOption(
                          icon: Icons.notifications_none_rounded,
                          title: "Notifications",
                          subtitle: "App alerts & promotional messages",
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const NotificationsScreen())),
                        ).animate().fadeIn(delay: 700.ms).slideX(begin: 0.1, end: 0),
                        
                        _buildMenuOption(
                          icon: Icons.help_outline_rounded,
                          title: "Help & Support",
                          subtitle: "24/7 customer service",
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const HelpSupportScreen())),
                        ).animate().fadeIn(delay: 800.ms).slideX(begin: 0.1, end: 0),
                        
                        const SizedBox(height: 30),
                        
                        CustomButton(
                          text: "Logout",
                          color: Colors.redAccent,
                          onTap: () {
                            ref.read(userProvider.notifier).logout();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (c) => const WelcomeScreen()),
                              (route) => false,
                            );
                          },
                        ).animate().fadeIn(delay: 900.ms),
                        
                        const SizedBox(height: 100),
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

  Widget _buildMenuOption({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: onTap,
        child: ClayContainer(
          borderRadius: 20,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.lightGreen.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppColors.navyBlue, size: 22),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: AppColors.navyBlue,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: AppColors.navyBlue.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: AppColors.navyBlue.withOpacity(0.3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
