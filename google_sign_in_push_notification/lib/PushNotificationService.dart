import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';


class PushNotificationService {
  PushNotificationService._();

  factory PushNotificationService() => instance;

  static final PushNotificationService instance = PushNotificationService._();

  final FirebaseMessaging _firebaseMessageInstance = FirebaseMessaging.instance;

  bool _isInitialize = false;

  Future<void> init() async {
    if (!_isInitialize) {
      _firebaseMessageInstance.requestPermission();
      _firebaseMessageInstance.setAutoInitEnabled(true);
      _isInitialize = true;
    }
  }

  Future<String?> getFCMToken() async {
    return await _firebaseMessageInstance.getToken();
  }

  Future<void> setupInteractedMessage() async {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBySdWqFy_3Nyo454P-2RTwpCqmD_JD4uY",
            appId: "1:546233373963:android:5a9b2dfe520a6422d0fe0e",
            messagingSenderId: "546233373963",
            projectId: "signinpushnotification"));
  }






}
