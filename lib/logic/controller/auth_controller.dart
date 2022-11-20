import 'package:ecommerce/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../routes/routes.dart';

class AuthController extends GetxController {
  bool isVisible = false;
  bool isChecked = false;
  var userName = '';
  var userAvatar = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  var google = GoogleSignIn();

  var isSignedIn = false;
  final GetStorage authBox = GetStorage();

  void visibility() {
    isVisible = !isVisible;
    update();
  }

  void checkBox() {
    isChecked = !isChecked;
    update();
  }

  void signUpFireBase(String name, String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        // userName = name;
        auth.currentUser!.updateDisplayName(name);
      });

      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'weak-password') {
        message = 'Password is too weak .. ';
      } else if (error.code == 'email-already-in-use') {
        message = 'Email already in use .. ';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: mainColor,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: mainColor,
          colorText: Colors.white);
    }
  }

  void logInFireBase(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      // .then((value) => userName = auth.currentUser!.displayName!);

      isSignedIn = true;
      authBox.write('auth', isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'Account doesn\'t excists - Invalid Email';
      } else if (e.code == 'worng-password') {
        message = 'Wrong Password - Please Try Again';
      } else {
        message = e.message.toString();
      }

      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: mainColor,
          colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Error!', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: mainColor,
          colorText: Colors.white);
    }
  }

  void googleSignUp() async {
    try {
      final GoogleSignInAccount? googleUser = await google.signIn();
      userName = googleUser!.displayName!;
      userAvatar = googleUser.photoUrl!;
      isSignedIn = true;
      authBox.write('auth', isSignedIn);

      update();
      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'Account doesn\'t excists - Invalid Email';
      } else {
        message = e.message.toString();
      }

      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: mainColor,
          colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Error!', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: mainColor,
          colorText: Colors.white);
    }
  }

  void signOut() async {
    try {
      await auth.signOut();
      await google.signOut();
      userName = '';
      userAvatar = '';
      isSignedIn = false;
      authBox.remove('auth');

      update();
      Get.offNamed(Routes.welcomeScreen);
    } catch (e) {
      Get.snackbar('Error!', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: mainColor,
          colorText: Colors.white);
    }
  }
}
