import 'package:flutter/material.dart';
import 'package:lukerieff/providers/me_provider.dart';
import 'package:lukerieff/screen/main/create_direct_chat_screen.dart';
import 'package:lukerieff/screen/main/user_search_screen.dart';
import 'package:lukerieff/screen/splash_screen.dart';
import 'package:lukerieff/screen/main/development_screen.dart';
import 'package:lukerieff/screen/main/root_screen.dart';
import 'package:lukerieff/screen/setup/auth_configuration_screen.dart';
import 'package:lukerieff/screen/setup/pin_configuration_screen.dart';
import 'package:lukerieff/screen/setup/server_configuration_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Root());
}

class Root extends StatefulWidget {
  const Root({
    super.key,
  });

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  static const String _initialRoute = "/splash";
  static final Map<String, Widget Function(BuildContext)> _routes = {
    "/splash": (final BuildContext context) => const SplashScreen(),
    "/setup/server_configuration": (final BuildContext context) =>
        const ServerConfigurationScreen(),
    "/setup/pin_configuration": (final BuildContext context) =>
        const PinConfigurationScreen(),
    "/setup/auth_configuration": (final BuildContext context) =>
        const AuthConfigurationScreen(),
    "/main/root": (final BuildContext context) => const RootScreen(),
    "/main/development": (final BuildContext context) =>
        const DevelopmentScreen(),
    "/main/chats/create/direct": (final BuildContext context) =>
        const CreateDirectChatScreen(),
    "/main/users/search": (final BuildContext context) =>
        const UserSearchScreen(),
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MeProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.purple,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            elevation: 5.0,
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
          ),
          navigationBarTheme: NavigationBarThemeData(
            backgroundColor: Colors.purple,
            indicatorColor: Colors.white.withOpacity(0.2),
          ),
          colorScheme: const ColorScheme.dark(
            primary: Colors.purple,
            onPrimary: Colors.white,
            secondary: Colors.deepPurple,
            onSecondary: Colors.white,
            tertiary: Colors.indigo,
            onTertiary: Colors.white,
            error: Colors.purpleAccent,
          ),
          errorColor: Colors.purpleAccent,
          scaffoldBackgroundColor: Colors.grey[900],
        ),
        routes: _routes,
        initialRoute: _initialRoute,
      ),
    );
  }
}
