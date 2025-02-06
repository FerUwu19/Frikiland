import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDqGsYwJTWDjWC9hTFS06YvwHU-2lMMJAg",
            authDomain: "frikiland-1.firebaseapp.com",
            projectId: "frikiland-1",
            storageBucket: "frikiland-1.appspot.com",
            messagingSenderId: "516308394070",
            appId: "1:516308394070:web:3a3b7551cebda4b51b1bf7",
            measurementId: "G-YLC0R91549"));
  } else {
    await Firebase.initializeApp();
  }
}
