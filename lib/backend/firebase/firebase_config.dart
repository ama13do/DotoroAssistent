import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAdLRW_VLpF_39csOCnTLLqwzrI_0pzzsw",
            authDomain: "gcp-banorte-hackaton-team-23.firebaseapp.com",
            projectId: "gcp-banorte-hackaton-team-23",
            storageBucket: "gcp-banorte-hackaton-team-23.appspot.com",
            messagingSenderId: "661301209520",
            appId: "1:661301209520:web:7e15e7cf4ba37c67ec0e75",
            measurementId: "G-MRGLK2XQSC"));
  } else {
    await Firebase.initializeApp();
  }
}
