import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // Prevent instantiation


  //this is for Primary

  static const Color primary100 = Color(0xFFCCE3F9);
  static const Color primary200 = Color(0xFFA8C8E8);
  static const Color primary300 = Color(0xFF6FA8DF);
  static const Color primary400 = Color(0xFF3991DE);
  static const Color primary500 = Color(0xFF0087FE); // Base
  static const Color primary600 = Color(0xFF0079DE);
  static const Color primary700 = Color(0xFF0066C0);
  static const Color primary800 = Color(0xFF004B8C);
  static const Color primary900 = Color(0xFF003771);

  static const Color primary90 = Color(0xFF0093FE); // 90%
  static const Color primary80 = Color(0xFF2B9FFE); // 80%
  static const Color primary20 = Color(0xFFD1E8FF); // 20%
  static const Color primary10 = Color(0xFFE7F3FF); // 10%
  static const Color primary5 = Color(0xFFF4F9FF);  // 5%


  // Secondary

  static const Color secondary100 = Color(0xFFDDF2BE);
  static const Color secondary200 = Color(0xFFC7EA96);
  static const Color secondary300 = Color(0xFFB3DF70);
  static const Color secondary400 = Color(0xFFA4D859);
  static const Color secondary500 = Color(0xFF95D244); // Base
  static const Color secondary600 = Color(0xFF8CBE3D);
  static const Color secondary700 = Color(0xFF80A633);
  static const Color secondary800 = Color(0xFF748E28);
  static const Color secondary900 = Color(0xFF626619);

  static const Color secondary90 = Color(0xFFA0D755); // 90%
  static const Color secondary80 = Color(0xFFABDB67); // 80%
  static const Color secondary20 = Color(0xFFEBF6D8); // 20%
  static const Color secondary10 = Color(0xFFF5FAEB); // 10%
  static const Color secondary5 = Color(0xFFF9FDF5);  // 5%


  //this is for Tertiary

  static const Color tertiary100 = Color(0xFFFFE2DF);
  static const Color tertiary200 = Color(0xFFFEC3BF);
  static const Color tertiary300 = Color(0xFFFFADA7);
  static const Color tertiary400 = Color(0xFFFF8D85);
  static const Color tertiary500 = Color(0xFFFF776B); // Base
  static const Color tertiary600 = Color(0xFFFF5144);
  static const Color tertiary700 = Color(0xFFFD3D2C);
  static const Color tertiary800 = Color(0xFFE1230A);
  static const Color tertiary900 = Color(0xFFA80E00);

  static const Color tertiary90 = Color(0xFFFF857B); // 90%
  static const Color tertiary80 = Color(0xFFFF938A); // 80%
  static const Color tertiary20 = Color(0xFFFFE4E2); // 20%
  static const Color tertiary10 = Color(0xFFFFF2F1); // 10%
  static const Color tertiary5 = Color(0xFFFFF9F8);  // 5%


  // this is for Dark

  static const Color dark500 = Color(0xFF0F1317); // Base
  static const Color dark90 = Color(0xFF272B2E);
  static const Color dark80 = Color(0xFF3F4245);
  static const Color dark20 = Color(0xFFCFD0D1);
  static const Color dark10 = Color(0xFFE7E7E8);
  static const Color dark5 = Color(0xFFF3F3F3);


  //this is for Gray

  static const Color gray500 = Color(0xFFABAFB5); // Base
  static const Color gray90 = Color(0xFFB3B7BC);
  static const Color gray80 = Color(0xFFBCBFC4);
  static const Color gray20 = Color(0xFFEEEFF0);
  static const Color gray10 = Color(0xFFF7F7F8);
  static const Color gray5 = Color(0xFFFBFBFB);


  //this is for  Light

  static const Color light500 = Color(0xFFD7E1E1); // Base
  static const Color light90 = Color(0xFFDBE4E4);
  static const Color light80 = Color(0xFFDFE7E7);
  static const Color light20 = Color(0xFFF6F9F9);
  static const Color light10 = Color(0xFFFBFCFC);
  static const Color light5 = Color(0xFFFDFDFD);


  // this is for White

  static const Color white500 = Color(0xFFFFFFFF); // Base
  static const Color white90 = Color(0xFFFEFEFE);
  static const Color white80 = Color(0xFFFCFCFC);
  static const Color white20 = Color(0xFFF5F5F5);
  static const Color white10 = Color(0xFFF3F3F3);
  static const Color white5 = Color(0xFFF3F3F3);


  // this for Color Options

  static const Color colorOption1 = Color(0xFF00C187);
  static const Color colorOption2 = Color(0xFF00C1B9);
  static const Color colorOption3 = Color(0xFF622EBC);
  static const Color colorOption4 = Color(0xFF1750BD);


  //this for Gradients

  static const LinearGradient gradient1 = LinearGradient(
    colors: [Color(0xFF46B95D), Color(0xFF00AD9A)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient gradient2 = LinearGradient(
    colors: [Color(0xFF00A9BA), Color(0xFF0083BC)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient gradient3 = LinearGradient(
    colors: [Color(0xFF7D2CBC), Color(0xFFA926BB)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
