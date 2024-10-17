// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyB0T9w6SXKO8PDnUiA46NZSmBOfujqcaBo',
    appId: '1:772379262829:web:8ca4cf86cf840961c22464',
    messagingSenderId: '772379262829',
    projectId: 'wegag-3a341',
    authDomain: 'wegag-3a341.firebaseapp.com',
    storageBucket: 'wegag-3a341.appspot.com',
    measurementId: 'G-1Y6K51VYYL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2E4V15mpwxSdhQ6Pn4dmZA0n8tof2Dkk',
    appId: '1:772379262829:android:819332b7851978e8c22464',
    messagingSenderId: '772379262829',
    projectId: 'wegag-3a341',
    storageBucket: 'wegag-3a341.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBMf4R_03b4yoIXgdmSraskGwjnxrHX698',
    appId: '1:772379262829:ios:4d823a0383f64217c22464',
    messagingSenderId: '772379262829',
    projectId: 'wegag-3a341',
    storageBucket: 'wegag-3a341.appspot.com',
    iosBundleId: 'com.example.wegag',
  );

}