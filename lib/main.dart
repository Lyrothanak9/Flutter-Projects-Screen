import 'package:flutter/material.dart';
import 'package:flutter_projects_screen/screen/get_start.dart';
import 'package:flutter_projects_screen/screen/login_screen.dart';
import 'package:flutter_projects_screen/screen/sign_up_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: 'https://vgrxvqcbxoqydpwmfbzd.supabase.co',
    publishableKey: 'sb_publishable_y1kh95r8MUaKiEXZAznBBA_X-fzKy2_'
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme interTextTheme = GoogleFonts.interTextTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: Color(0xFF2373F4),
          secondary: Colors.grey.shade400,

        ),
        textTheme: interTextTheme.copyWith(
          displayLarge: interTextTheme.displayLarge?.copyWith(
            fontSize: 57,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: interTextTheme.headlineMedium?.copyWith(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
          titleLarge: interTextTheme.titleLarge?.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: interTextTheme.bodyLarge?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: interTextTheme.bodyMedium?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          labelLarge: interTextTheme.labelLarge?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const GetStartScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}
