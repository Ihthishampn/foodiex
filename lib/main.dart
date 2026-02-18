
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodiex/core/di/di.dart';
import 'package:foodiex/features/auth/loginAndSignUp/presentation/provider/auth_provider.dart';
import 'package:foodiex/features/auth/loginAndSignUp/presentation/screens/login_screen.dart';
import 'package:foodiex/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    
    providers: [ChangeNotifierProvider<AuthProvider>(create: (context) =>AuthProvider(authrepo),)],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
