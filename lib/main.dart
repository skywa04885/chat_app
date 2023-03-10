import 'package:flutter/material.dart';
import 'package:lukerieff/screen/splash_screen.dart';
import 'package:lukerieff/screen/main/development_screen.dart';
import 'package:lukerieff/screen/main/root_screen.dart';
import 'package:lukerieff/screen/setup/auth_configuration_screen.dart';
import 'package:lukerieff/screen/setup/pin_configuration_screen.dart';
import 'package:lukerieff/screen/setup/ServerConfigurationScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const String _initialRoute = "/splash";
  static final Map<String, Widget Function(BuildContext)> _routes = {
    "/splash": (final BuildContext context) => const SplashScreen(),
    "/setup/server_configuration": (final BuildContext context) =>
        const ServerConfigurationScreen(),
    "/setup/pin_configuration": (final BuildContext context) =>
        const PinConfigurationScreen(),
    "/setup/auth_configuration": (final BuildContext context) =>
        const AuthConfigurationScreen(),
    "/main/root": (final BuildContext context) =>
        const RootScreen(),
    "/main/development": (final BuildContext context) =>
        const DevelopmentScreen(),
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.purple,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          enableFeedback: true,
          elevation: 5.0,
        ),
        colorScheme: const ColorScheme.dark(
          primary: Colors.purple,
          onPrimary: Colors.white,
          secondary: Colors.deepPurple,
          onSecondary: Colors.white,
          error: Colors.purpleAccent,
        ),
        errorColor: Colors.purpleAccent,
      ),
      routes: _routes,
      initialRoute: _initialRoute,
    );
  }
}
