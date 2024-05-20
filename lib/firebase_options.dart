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
    apiKey: 'AIzaSyBf8cSxMZ8CIUp--BxI9oxmrLs_LgAZ7Ag',
    appId: '1:3622515206:web:db50eae01baaf7aebb8987',
    messagingSenderId: '3622515206',
    projectId: 'cookcy-196c8',
    authDomain: 'cookcy-196c8.firebaseapp.com',
    storageBucket: 'cookcy-196c8.appspot.com',
    measurementId: 'G-G0FDGNV31Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChX10o0JiJEQiBHKuA71xkkoEs80nf1Kc',
    appId: '1:3622515206:android:fc42081c4281867fbb8987',
    messagingSenderId: '3622515206',
    projectId: 'cookcy-196c8',
    storageBucket: 'cookcy-196c8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCuXHjzPy_kebS4NOMjiIqi2-UgFs9tjg',
    appId: '1:3622515206:ios:978e2131ed46611ebb8987',
    messagingSenderId: '3622515206',
    projectId: 'cookcy-196c8',
    storageBucket: 'cookcy-196c8.appspot.com',
    androidClientId: '3622515206-d8birt46rmalfpa3buv1ai1kpki4al9k.apps.googleusercontent.com',
    iosClientId: '3622515206-8ho724oilkl5hj949l91jh78gbr0cas7.apps.googleusercontent.com',
    iosBundleId: 'com.example.cookcy',
  );

}