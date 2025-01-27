import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBaqlWtoGqEb2wrindDoFo-WWqZ3d1roks",
            authDomain: "quiz-app-2db15.firebaseapp.com",
            projectId: "quiz-app-2db15",
            storageBucket: "quiz-app-2db15.firebasestorage.app",
            messagingSenderId: "148952548626",
            appId: "1:148952548626:web:ebaa4ca38e6bf617091fcb",
            measurementId: "G-WGR5YPWKD6"));
  } else {
    await Firebase.initializeApp();
  }
}
