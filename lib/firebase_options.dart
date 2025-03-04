import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return FirebaseOptions(
        apiKey: "AIzaSyBddhRF_8ZZ6UXviG1IJmNxXC0ECfWG0LQ",
        authDomain: "footballactivity-1413b.firebaseapp.com",
        projectId: "footballactivity-1413b",
        storageBucket: "footballactivity-1413b.appspot.com",
        messagingSenderId: "SENDER_ID",
        appId: "APP_ID",
        measurementId: "G-MEASUREMENT_ID",
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return FirebaseOptions(
        apiKey: "AIzaSyBddhRF_8ZZ6UXviG1IJmNxXC0ECfWG0LQ",
        appId: "APP_ID",
        messagingSenderId: "SENDER_ID",
        projectId: "footballactivity-1413b",
        storageBucket: "footballactivity-1413b.appspot.com",
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      return FirebaseOptions(
        apiKey: "AIzaSyBddhRF_8ZZ6UXviG1IJmNxXC0ECfWG0LQ",
        appId: "APP_ID",
        messagingSenderId: "SENDER_ID",
        projectId: "footballactivity-1413b",
        storageBucket: "footballactivity-1413b.appspot.com",
        iosBundleId: "BUNDLE_ID",
      );
    } else {
      throw UnsupportedError("Platforma nu este suportată.");
    }
  }
}
