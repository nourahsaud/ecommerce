import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/view/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'SHOP!',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WelcomeScreen(),
        initialRoute: FirebaseAuth.instance.currentUser != null ||
                GetStorage().read<bool>('auth') == true
            ? AppRoutes.main
            : AppRoutes.welcome,
        getPages: AppRoutes.routes);
  }
}
