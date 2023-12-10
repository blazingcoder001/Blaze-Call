// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAI0cDWG6dHuE4GLeoX_mYnpApiH0gUb9o',
    appId: '1:1092604627673:web:b0ba2e852bcaa7bd968cc8',
    messagingSenderId: '1092604627673',
    projectId: 'blaze-call',
    authDomain: 'blaze-call.firebaseapp.com',
    storageBucket: 'blaze-call.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDuJ916PwovspsemdCIRzEqCiR2M3ylNBA',
    appId: '1:1092604627673:android:d3387bcbec929250968cc8',
    messagingSenderId: '1092604627673',
    projectId: 'blaze-call',
    storageBucket: 'blaze-call.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAin3EmX8JF0WaCKKVKFHwFE3LqKq1BhYI',
    appId: '1:1092604627673:ios:00e55e7ca74bfa2e968cc8',
    messagingSenderId: '1092604627673',
    projectId: 'blaze-call',
    storageBucket: 'blaze-call.appspot.com',
    iosBundleId: 'com.blazecall.app',
  );
}
