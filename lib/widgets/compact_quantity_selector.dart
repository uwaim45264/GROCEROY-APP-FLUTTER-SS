import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme.dart';
import 'warning_dialog.dart';

class CompactQuantitySelector extends StatefulWidget {
  final int initialValue;
  final ValueChanged<int>? onChanged;
  final int? max;

  const CompactQuantitySelector({
    super.key,
    this.initialValue = 1,
    this.onChanged,
    this.max,
  });

  @override
  State<CompactQuantitySelector> createState() => _CompactQuantitySelectorState();
}

class _CompactQuantitySelectorState extends State<CompactQuantitySelector> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialValue;
  }

  @override
  void didUpdateWidget(CompactQuantitySelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      quantity = widget.initialValue;
    }
  }

  void _updateQuantity(int newQty) {
    if (newQty < 1) return;
    
    if (widget.max != null && newQty > widget.max!) {
      WarningDialog.show(
        context,
        title: "Out of Stock",
        message: "Sorry, we only have ${widget.max} items in stock.",
        confirmText: "Okay",
      );
      return;
    }

    setState(() {
      quantity = newQty;
    });
    widget.onChanged?.call(quantity);
  }

  void _showQuantityDialog() {
    final TextEditingController controller = TextEditingController(text: quantity.toString());
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          "SET QUANTITY",
          style: GoogleFonts.orbitron(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.navyBlue,
            letterSpacing: 1,
          ),
        ),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          autofocus: true,
          textAlign: TextAlign.center,
          style: GoogleFonts.shareTechMono(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.navyBlue,
          ),
          decoration: InputDecoration(
            hintText: "Enter value",
            hintStyle: GoogleFonts.shareTechMono(fontSize: 16, color: Colors.grey.withOpacity(0.5)),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.lightGreen.withOpacity(0.3))),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.lightGreen)),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "CANCEL",
              style: GoogleFonts.shareTechMono(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              final newQty = int.tryParse(controller.text);
              if (newQty != null) {
                _updateQuantity(newQty);
              }
              Navigator.pop(context);
            },
            child: Text(
              "CONFIRM",
              style: GoogleFonts.shareTechMono(
                color: AppColors.darkGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildBtn(Icons.remove_rounded, () => _updateQuantity(quantity - 1)),
        GestureDetector(
          onTap: _showQuantityDialog,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              quantity.toString(),
              style: GoogleFonts.shareTechMono(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.navyBlue,
              ),
            ),
          ),
        ),
        _buildBtn(Icons.add_rounded, () => _updateQuantity(quantity + 1)),
      ],
    );
  }

  Widget _buildBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: AppColors.navyBlue, size: 14),
      ),
    );
  }
}
