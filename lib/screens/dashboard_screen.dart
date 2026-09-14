import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/app_theme.dart';
import '../widgets/custom_widgets.dart';
import '../models/product.dart';

import 'wishlist_screen.dart';
import 'cart_screen.dart';
import 'notifications_screen.dart';
import 'product_detail_screen.dart';
import 'all_categories_screen.dart';
import '../categories/fruits_screen.dart';
import '../categories/veggies_screen.dart';
import '../categories/dairy_screen.dart';
import '../categories/meat_screen.dart';
import '../categories/bakery_screen.dart';
import '../categories/beverages_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardContent(),
    const WishlistScreen(),
    const CartScreen(),
    const NotificationsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    // THIS IS THE SAMPLE DATA LATER ON I WILL BE FETCHING FROM THE DATABASE ...................
    final List<Product> popularDeals = [
      Product(
        id: 'p1',
        name: "Organic Banana",
        price: "Rs 4.99",
        weight: "1KG",
        imagePath: 'assets/images/2.jpg',
        icon: Icons.eco_rounded,
        bgColor: AppColors.cream,
        stock: 12,
      ),
      Product(
        id: 'p2',
        name: "Red Apple",
        price: "Rs 2.49",
        weight: "1KG",
        imagePath: 'assets/images/3.jpg',
        icon: Icons.eco_rounded,
        bgColor: Colors.red[50],
        stock: 5,
      ),
      Product(
        id: 'p3',
        name: "Fresh Ginger",
        price: "Rs 1.99",
        weight: "1KG",
        imagePath: 'assets/images/4.jpg',
        icon: Icons.eco_rounded,
        bgColor: Colors.orange[50],
        stock: 0, // Testing Out of Stock
      ),
      Product(
        id: 'p4',
        name: "Bell Pepper",
        price: "Rs 3.25",
        weight: "1KG",
        imagePath: 'assets/images/5.jpg',
        icon: Icons.eco_rounded,
        bgColor: Colors.green[50],
        stock: 8,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundBlobs(),
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const CustomAppBar(
                    rightIcon: Icons.person_outline_rounded,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Uwaim",
                          style: GoogleFonts.shareTechMono(
                            fontSize: 10,
                            color: AppColors.navyBlue.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Text(
                          "Fresh items available",
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: AppColors.navyBlue,
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(duration: 500.ms).slideX(begin: -0.05),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: CustomSearchBar(),
                  ).animate().fadeIn(delay: 150.ms),
                  const SizedBox(height: 20),
                  Container(
                    height: 135,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.lightGreen, AppColors.darkGreen],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.darkGreen.withOpacity(0.2),
                          offset: const Offset(0, 4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Positioned(
                            right: -5,
                            top: -5,
                            bottom: -5,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.horizontal(left: Radius.circular(80)),
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/1.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "30% OFF",
                                  style: GoogleFonts.orbitron(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1,
                                  ),
                                ),
                                Text(
                                  "Inventory Sale",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: AppColors.cream,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    "REDEEM",
                                    style: GoogleFonts.orbitron(
                                      color: AppColors.darkGreen,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animate().scale(delay: 200.ms, duration: 400.ms, curve: Curves.easeOutBack),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: SectionHeader(
                      title: "CATEGORIES",
                      actionText: "VIEW ALL",
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AllCategoriesScreen())),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 95,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(left: 25, right: 10),
                      children: [
                        _buildCategoryCard(context, "Fruits", "assets/categories/Fruits Category.png", AppColors.cream, const FruitsScreen(), 0),
                        _buildCategoryCard(context, "Veggies", "assets/categories/Vegetables Category.png", AppColors.skyBlue, const VeggiesScreen(), 1),
                        _buildCategoryCard(context, "Dairy", "assets/categories/Dairy Category.png", const Color(0xFFE1F5FE), const DairyScreen(), 2),
                        _buildCategoryCard(context, "Meat", "assets/categories/Meat Category.png", const Color(0xFFFFEBEE), const MeatScreen(), 3),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: SectionHeader(title: "POPULAR DEALS", actionText: "HOT"),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 15,
                      ),
                      itemCount: popularDeals.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: popularDeals[index],
                          index: index,
                          onTap: () => Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => ProductDetailScreen(product: popularDeals[index]))
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 90),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String name, String imagePath, Color bgColor, Widget screen, int index) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen)),
      child: Container(
        margin: const EdgeInsets.only(right: 18),
        child: Column(
          children: [
            ClayContainer(
              height: 58,
              width: 58,
              borderRadius: 18,
              child: Center(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: bgColor.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Image.asset(imagePath, fit: BoxFit.contain),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              name.toUpperCase(),
              style: GoogleFonts.orbitron(
                fontSize: 8,
                fontWeight: FontWeight.bold,
                color: AppColors.navyBlue,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: (300 + (index * 80)).ms).slideX(begin: 0.15, end: 0);
  }
}
