import 'package:flutter/material.dart';

// اللون الأزرق الفاتح المستخدم في الخلفية العلوية وزر الشراء
const Color primaryColor = Color(0xFF2E7DAB);
// الألوان المستخدمة في الخيارات اللونية
const Color blueColor = Color(0xFF4A92E6);
const Color orangeColor = Color(0xFFF6B26B);
const Color brownColor = Color(0xFF9C6D5A);

ThemeData buildThemeData() {
  return ThemeData(
    // اللون الرئيسي للتطبيق
    primaryColor: primaryColor,

    // اللون المستخدم لعناصر الخلفية
    scaffoldBackgroundColor: Colors.white,

    // نمط AppBar
    appBarTheme:const AppBarTheme(
      backgroundColor: primaryColor, // لون خلفية AppBar
      titleTextStyle: TextStyle(
        color: Colors.white, // لون نص العنوان في AppBar
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.white, // لون الأيقونات في AppBar
      ),
    ),

    // نمط الأزرار المرتفعة
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor), // لون خلفية الأزرار
        foregroundColor: MaterialStateProperty.all(Colors.white), // لون النص والأيقونات في الأزرار
        textStyle: MaterialStateProperty.all(const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        )),
      ),
    ),

    // نمط النصوص
    textTheme:const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24, // حجم النص
        fontWeight: FontWeight.bold, // وزن النص (عريض)
        color: Colors.black, // لون النص للعناوين الكبيرة
      ),
      headlineMedium: TextStyle(
        fontSize: 20, // حجم النص
        fontWeight: FontWeight.bold, // وزن النص (عريض)
        color: Colors.black, // لون النص للعناوين المتوسطة
      ),
      bodyLarge: TextStyle(
        fontSize: 16, // حجم النص
        color: Colors.black, // لون النص للنصوص العادية
      ),
      bodyMedium: TextStyle(
        fontSize: 14, // حجم النص
        color: Colors.black, // لون النص للنصوص الصغيرة
      ),
    ),

    // نمط الأيقونات
    iconTheme:const IconThemeData(
      color: Colors.black, // لون الأيقونات بشكل عام
    ),

  );
}
