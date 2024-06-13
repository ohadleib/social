import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAFw-KCmvZegn5xSqFtz4MgIH9uxQS0uiw',
    appId: '1:807207421003:web:5dd742c5260746280df9ce',
    messagingSenderId: '807207421003',
    projectId: 'minimal-social-app-bdbf8',
    authDomain: 'minimal-social-app-bdbf8.firebaseapp.com',
    storageBucket: 'minimal-social-app-bdbf8.appspot.com',
    measurementId: 'G-ABCDEFG123', // אם יש לך Measurement ID עבור Web, הכנס אותו כאן
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAFw-KCmvZegn5xSqFtz4MgIH9uxQS0uiw',
    appId: '1:807207421003:android:5dd742c5260746280df9ce',
    messagingSenderId: '807207421003',
    projectId: 'minimal-social-app-bdbf8',
    storageBucket: 'minimal-social-app-bdbf8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAFw-KCmvZegn5xSqFtz4MgIH9uxQS0uiw',
    appId: '1:807207421003:ios:521a4d1420acd9220df9ce',
    messagingSenderId: '807207421003',
    projectId: 'minimal-social-app-bdbf8',
    storageBucket: 'minimal-social-app-bdbf8.appspot.com',
    iosClientId: 'YOUR_IOS_CLIENT_ID', // אם יש לך iOS Client ID, הכנס אותו כאן
    iosBundleId: 'com.example.testApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAFw-KCmvZegn5xSqFtz4MgIH9uxQS0uiw',
    appId: '1:807207421003:macos:5dd742c5260746280df9ce',
    messagingSenderId: '807207421003',
    projectId: 'minimal-social-app-bdbf8',
    storageBucket: 'minimal-social-app-bdbf8.appspot.com',
    iosClientId: 'YOUR_IOS_CLIENT_ID', // אם יש לך iOS Client ID עבור MacOS, הכנס אותו כאן
    iosBundleId: 'com.example.testApp',
  );
}
