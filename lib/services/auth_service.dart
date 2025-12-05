import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Auth state changes stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // -------------------------------
  // Sign up with email and password
  // -------------------------------
  Future<String?> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = result.user;

      // Update display name
      await user?.updateDisplayName(username);

      // Add user to Firestore with role
      await _firestore.collection('users').doc(user!.uid).set({
        'name': username,
        'email': email,
        'role': 'user', // default role
        'createdAt': FieldValue.serverTimestamp(),
      });

      return null; // Success
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'An error occurred';
    }
  }

  // -------------------------------
  // Sign in with email and password
  // -------------------------------
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Success
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'An error occurred';
    }
  }

  // -------------------------------
  // Sign in with Google
  // -------------------------------
  Future<String?> signInWithGoogle() async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider.addScope('https://www.googleapis.com/auth/userinfo.email');
      googleProvider.addScope('https://www.googleapis.com/auth/userinfo.profile');
      googleProvider.setCustomParameters({'prompt': 'select_account'});

      UserCredential userCredential =
          await _auth.signInWithPopup(googleProvider);

      User? user = userCredential.user;

      // Add or update user in Firestore with role
      await _firestore.collection('users').doc(user!.uid).set({
        'name': user.displayName ?? 'No Name',
        'email': user.email ?? 'No Email',
        'role': 'user', // default role
        'lastLogin': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true)); // merge=true avoids overwriting existing data

      return null; // Success
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'popup-closed-by-user':
        case 'cancelled-popup-request':
          return 'Sign in cancelled';
        case 'popup-blocked':
          return 'Popup blocked. Allow popups.';
        case 'unauthorized-domain':
          return 'This domain is not authorized. Add it to Firebase Console.';
        default:
          return e.message ?? 'An error occurred during Google sign in';
      }
    } catch (e) {
      return 'Failed to sign in with Google: $e';
    }
  }

  // -------------------------------
  // Sign out
  // -------------------------------
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // -------------------------------
  // Onboarding helpers
  // -------------------------------
  Future<bool> hasCompletedOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('completedOnboarding') ?? false;
  }

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('completedOnboarding', true);
  }

  // -------------------------------
  // Check if user signed in with Google
  // -------------------------------
  bool isGoogleUser() {
    final user = currentUser;
    if (user == null) return false;
    return user.providerData.any((provider) => provider.providerId == 'google.com');
  }
}
