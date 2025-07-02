// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Authenticationrepository extends GetxController {
  static Authenticationrepository get instance => Get.find();
  // final devicestroage = GetStorage();
  final auth = FirebaseAuth.instance;
  User? get authuser => auth.currentUser;

  @override
  void onReady() {
    super.onReady();
    // screenredirect();
    // loginscrrendirect();
  }

  // screenredirect() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     if (user.emailVerified) {
  //       await Localstroage.initUserId(user.uid);
  //       await Get.offAll(() => CustomBottomnavgtionbarhome());
  //     } else {
  //       Get.offAll(() => EmailScreen(email: auth.currentUser?.email));
  //     }
  //   }
  // }

  // loginscrrendirect() {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user!.emailVerified) {
  //     Get.offAll(
  //       transition: Transition.rightToLeft,
  //       () => AnimatonsScreen(
  //         anmation: AppAnimatons.animation2,
  //         text: "Logging You in....",
  //       ),
  //     );
  //   } else {
  //     Get.offAll(() => EmailScreen(email: auth.currentUser?.email));
  //   }
  // }

  /* _____________ Email & Password signin _______________ */
  //[EmailAuthentication] Sign in
  // Future<UserCredential?> loginwithemailandpassword(
  //   String email,
  //   String password,
  // ) async {
  //   try {
  //     return await auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == "too-many-requests") {
  //       print("Too many attempts, please try again later.");
  //     } else {
  //       Get.defaultDialog(
  //         backgroundColor: Colors.white,
  //         title: "No account found",
  //         content: SizedBox(
  //           width: 250.w,
  //           height: 120.h,
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Text("Check your email and passord and Try agiang"),
  //               SizedBox(height: 20),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Container(
  //                     width: 100.w,
  //                     height: 40.h,
  //                     decoration: BoxDecoration(
  //                       shape: BoxShape.rectangle,
  //                       color: Colors.grey[300],
  //                     ),
  //                     child: TextButton(
  //                       onPressed: () {
  //                         Get.back();
  //                       },
  //                       child: Text(
  //                         "TRY AGAIN",
  //                         style: TextStyle(color: Colors.black),
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(width: 10),
  //                   Container(
  //                     width: 130.w,
  //                     height: 40.h,
  //                     decoration: BoxDecoration(color: Colors.red),
  //                     child: TextButton(
  //                       onPressed: () => Get.offAll(() => Signupscreen()),
  //                       child: Text(
  //                         "CREATE NEW ACCOUNT",
  //                         style: TextStyle(color: Colors.white, fontSize: 9.sp),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //         titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //       );
  //       print("FirebaseAuth Error: ${e.code}");
  //     }
  //     return null;
  //   } on FirebaseException catch (e) {
  //     print("Firebase Exception: ${e.message}");
  //     return null;
  //   } on FormatException catch (e) {
  //     print("Format Exception: ${e.message}");
  //     return null;
  //   } on PlatformException catch (e) {
  //     print("Platform Exception: ${e.message}");
  //     return null;
  //   } catch (e) {
  //     print("Something went wrong: $e");
  //     return null;
  //   }
  // }

  //[EmailAuthentication] =REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException {
      throw FirebaseAuthException;
    } on FirebaseException {
      throw FirebaseException;
    } on FormatException {
      throw FormatException();
    } on PlatformException {
      throw PlatformException;
    } catch (e) {
      throw "Something went Wrong. Please try agian";
    }
  }

  //[Email Authentication] -Forgot Password
  Future<void> sendrestpassowrdlink(String email) async {
    try {
      return await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException {
      throw FirebaseAuthException;
    } on FirebaseException {
      throw FirebaseException;
    } on FormatException {
      throw FormatException();
    } on PlatformException {
      throw PlatformException;
    } catch (e) {
      throw "Something went Wrong. Please try agian";
    }
  }

  //[GOGGLE SIGN IN]- GOOGLE SIGN IN
  // Future<UserCredential?> googlesignin() async {
  //   try {
  //     // Googlesign Account all  list the email can pop
  //     final GoogleSignInAccount? useraccount = await GoogleSignIn().signIn();
  //     // obtain the auth details  from the request
  //     final GoogleSignInAuthentication? googleauth =
  //         await useraccount?.authentication;
  //     // create a New Creadential
  //     final creadential = GoogleAuthProvider.credential(
  //       accessToken: googleauth?.accessToken,
  //       idToken: googleauth?.idToken,
  //     );
  //     // pass to credential in to firebase
  //     return await auth.signInWithCredential(creadential);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == "too-many-requests") {
  //       print("Too many attempts, please try again later.");
  //     }
  //     return null;
  //   } on FirebaseException catch (e) {
  //     print("Firebase Exception: ${e.message}");
  //     return null;
  //   } on FormatException catch (e) {
  //     print("Format Exception: ${e.message}");
  //     return null;
  //   } on PlatformException catch (e) {
  //     print("Platform Exception: ${e.message}");
  //     return null;
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Something Went weong:$e');
  //     }
  //     return null;
  //   }
  // }

  //[EmailVerificatio] - Mail Verfication
  Future<void> sendEmailVerfication() async {
    try {
      await auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException {
      throw FirebaseAuthException;
    } on FirebaseException {
      throw FirebaseException;
    } on FormatException {
      throw FormatException();
    } on PlatformException {
      throw PlatformException;
    } catch (e) {
      throw "Something went Wrong. Please try agian";
    }
  }

  // [LogOutUser] - Valid for any authentication.
  // Future<void> logout() async {
  //   try {
  //     await GoogleSignIn().signOut();
  //     FirebaseAuth.instance.signOut();
  //     Get.offAll(LoginScreen());
  //   } on FirebaseAuthException {
  //     throw FirebaseAuthException;
  //   } on FirebaseException {
  //     throw FirebaseException;
  //   } on FormatException {
  //     throw FormatException();
  //   } on PlatformException {
  //     throw PlatformException;
  //   } catch (e) {
  //     throw "Something went Wrong. Please try agian";
  //   }
  // }

  // ReAuthencation User
  Future<void> reauthenticationEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      // Create a Credential
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      print('Emaill: $email, Passwordd: $password');

      // Re-authenticate
      await auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException {
      rethrow; // Throw actual error for handling
    } on FirebaseException {
      rethrow;
    } on FormatException {
      rethrow;
    } on PlatformException {
      rethrow;
    } catch (e) {
      throw "Something went wrong. Please try again.";
    }
  }

  // Delete Account
  // Future<void> deleteaccount() async {
  //   try {
  //     await UserRepository.instance.removedata(auth.currentUser!.uid);
  //     await auth.currentUser?.delete();
  //   } on FirebaseAuthException {
  //     throw FirebaseAuthException;
  //   } on FirebaseException {
  //     throw FirebaseException;
  //   } on FormatException {
  //     throw FormatException();
  //   } on PlatformException {
  //     throw PlatformException;
  //   } catch (e) {
  //     throw "Something went Wrong. Please try agian";
  //   }
  // }
}
