import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.instance.setupFlutterNotifications();
  await NotificationService.instance.showNotification(message);
}

class NotificationService {
  bool _isFlutterLocalNotificationsInitialized = false;
  final _localNotification = FlutterLocalNotificationsPlugin();
  final _firebaseMessaging = FirebaseMessaging.instance;

  NotificationService._();
  static final NotificationService instance = NotificationService._();

  Future<void> initialize() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await requestPermission();
    await setupFlutterNotifications(); // Ensure channel setup
    await _setupMessageHandlers();
    await getDeviceToken();

    // iOS: Show notifications in foreground
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  /// Request permission
  Future<void> requestPermission() async {
    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      carPlay: false,
      provisional: false,
      announcement: false,
      criticalAlert: false,
    );
    debugPrint('Permission status: ${settings.authorizationStatus}');
  }

  /// Setup Android & iOS notification
  Future<void> setupFlutterNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) return;

    /// Android Setup
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      'general_channel',
      'General Notifications',
      description: 'This channel is used for normal notifications.',
      importance: Importance.high,
      playSound: true,
      enableLights: true,
      ledColor: Colors.red,
      enableVibration: true,
      vibrationPattern: Int64List.fromList([0, 500, 200, 500]),
    );

    await _localNotification
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final initializationSettingsDarwin = DarwinInitializationSettings();

    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await _localNotification.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (details) {
          debugPrint('Notification Clicked: ${details.payload}');
        });

    _isFlutterLocalNotificationsInitialized = true;
  }

  /// Show notification
  Future<void> showNotification(RemoteMessage message) async {
    try {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      final androidNotificationDetails = AndroidNotificationDetails(
        'general_channel',
        'General Notifications',
        channelDescription: 'This channel is used for general notifications.',
        playSound: true,
        enableLights: true,
        ledColor: Colors.red,
        ledOnMs: 1000,
        ledOffMs: 500,
        enableVibration: true,
        priority: Priority.high,
        importance: Importance.high,
        icon: '@mipmap/ic_launcher',
        vibrationPattern: Int64List.fromList([0, 500, 200, 500]),
      );

      final iOS = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );
      final platform = NotificationDetails(android: androidNotificationDetails, iOS: iOS);

      if (notification != null && android != null) {
        await _localNotification.show(
          notification.hashCode,
          notification.title,
          notification.body,
          platform,
          payload: message.data['route'] ?? '',
        );
      }
    } catch (e) {
      debugPrint('Error showing notification: $e');
    }
  }

  /// Listen message
  Future<void> _setupMessageHandlers() async {
    FirebaseMessaging.onMessage.listen(showNotification);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);

    final initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      _handleBackgroundMessage(initialMessage);
    }
  }

  void _handleBackgroundMessage(RemoteMessage message) {
    if (message.data['type'] == 'chat') {
      debugPrint('Navigate to chat screen with data: ${message.data}');
    }
  }

  Future<String?> getDeviceToken() async {
    final token = await _firebaseMessaging.getToken();
    debugPrint('FCM Token: $token');
    return token;
  }
}
