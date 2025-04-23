import 'package:flutter/material.dart';

import 'ui/screens/home_screen.dart';

void main() {
  // Ensure that the Flutter framework is fully initialized.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Define a custom color scheme for the application.
    const Color primaryColor = Color(0xFF004D40); // Dark Teal
    const Color onPrimaryColor = Colors.white;
    const Color secondaryColor = Color(0xFF64DD17); // Light Green
    const Color onSecondaryColor = Colors.black;

    return MaterialApp(
      title: 'Patrol Assistant',
      theme: ThemeData(
        // Define a custom color scheme based on the defined colors.
        colorScheme: const ColorScheme.light().copyWith(
          primary: primaryColor,
          onPrimary: onPrimaryColor,
          secondary: secondaryColor,
          onSecondary: onSecondaryColor,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
