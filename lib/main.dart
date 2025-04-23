import 'package:flutter/material.dart';

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
        // Customize text themes for consistency throughout the app.
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontSize: 32.0, fontWeight: FontWeight.bold, color: primaryColor),
          bodyLarge: TextStyle(fontSize: 18.0, color: Colors.black87),
        ),
      ),
      home: const MyHomePage(title: 'Patrol Assistant'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Welcome to', style: Theme.of(context).textTheme.bodyLarge),
          Text('Patrol Assistant',
              style: Theme.of(context).textTheme.headlineLarge),
        ]),
      ),
    );
  }
}
