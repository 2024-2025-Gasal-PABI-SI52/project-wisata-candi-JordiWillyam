import 'package:flutter/material.dart';
import 'package:project_wisata_candi/screens/home_screen.dart';
import 'package:project_wisata_candi/screens/main_screen.dart';
import 'package:project_wisata_candi/screens/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isSignIn = prefs.getBool("isSignIn") ?? false;

  runApp(MainApp(
    isSignIn: isSignIn,
  ));
}

class MainApp extends StatelessWidget {
  final bool isSignIn;
  const MainApp({super.key, required this.isSignIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wisata Candi",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.deepPurple),
          titleTextStyle: TextStyle(
              color: Colors.deepPurple,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          primary: Colors.deepPurple,
          surface: Colors.deepPurple[50],
        ),
        useMaterial3: true,
      ),
      // home: DetailScreen(
      //   candi: candiList[0],
      // ),
      // home: ProfileScreen(),
      // home: SignInScreen(),
      home: isSignIn ? const HomeScreen() : const SignInScreen(),
      routes: {
        "/login": (context) => const SignInScreen(),
        "/home": (context) => const MainScreen(),
      },
    );
  }
}
