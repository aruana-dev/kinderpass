import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyABlD2aN_GOs07Y9JyJz6qURHgvZumwLd8",
            authDomain: "ch-aruana-kinderpass-v3.firebaseapp.com",
            projectId: "ch-aruana-kinderpass-v3",
            storageBucket: "ch-aruana-kinderpass-v3.appspot.com",
            messagingSenderId: "734257148272",
            appId: "1:734257148272:web:ccab24e6d25cfb1a12dfb5",
            measurementId: "G-81G9MH35QX"));
  } else {
    await Firebase.initializeApp();
  }
}
