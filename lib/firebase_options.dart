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
        return macos;
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
    apiKey: 'AIzaSyB1eMpABoP2Bd2tZLpErxPGuJYwFpYdsrs',
    appId: '1:603431232526:web:ace38cd245b771afa7885f',
    messagingSenderId: '603431232526',
    projectId: 'user-management-6d841',
    authDomain: 'user-management-6d841.firebaseapp.com',
    storageBucket: 'user-management-6d841.appspot.com',
    measurementId: 'G-WTC3FNLF3Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbVj1qFucj-dZQdiuTNUZBT9a49gU9M_M',
    appId: '1:603431232526:android:5b49484ffd49161ca7885f',
    messagingSenderId: '603431232526',
    projectId: 'user-management-6d841',
    storageBucket: 'user-management-6d841.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAfxcs6vh4ETn4_ZXaNse__I3zkO6aGMDM',
    appId: '1:603431232526:ios:47844e82bce19117a7885f',
    messagingSenderId: '603431232526',
    projectId: 'user-management-6d841',
    storageBucket: 'user-management-6d841.appspot.com',
    iosBundleId: 'com.techswivwel.mnhwTask2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAfxcs6vh4ETn4_ZXaNse__I3zkO6aGMDM',
    appId: '1:603431232526:ios:dfc4555c2f1328c0a7885f',
    messagingSenderId: '603431232526',
    projectId: 'user-management-6d841',
    storageBucket: 'user-management-6d841.appspot.com',
    iosBundleId: 'com.techswivwel.mnhwTask2.RunnerTests',
  );
}
