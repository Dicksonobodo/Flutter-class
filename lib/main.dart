import 'package:first_app/screens/auth/auth_screen.dart';
import 'package:first_app/screens/home.dart';
import 'package:first_app/screens/onboarding/onboarding_screen.dart';
import 'package:first_app/screens/profile.dart';
import 'package:first_app/screens/splash/splash_screen.dart';
import 'package:first_app/screens/admin_dashboard/admin_dashboard.dart';
import 'package:first_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final AuthService _authService = AuthService();
  User? _user;
  String? _role;

  @override
  void initState() {
    super.initState();

    // Listen to auth changes
    _authService.authStateChanges.listen((user) async {
      if (user != null) {
        _user = user;
        // Fetch role from Firestore
        final doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        _role = doc['role'] ?? 'user';
      } else {
        _user = null;
        _role = null;
      }
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/auth': (context) => const AuthScreen(),
        '/home': (context) {
          if (_user != null) {
            if (_role == 'admin') {
              return const AdminDashboard();
            } else {
              return const UserHome();
            }
          } else {
            return const AuthScreen();
          }
        },
        '/profile': (context) => const Profile(),
      },
    );
  }
}
      