import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tmdb_movies/di.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/actor_entity.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/credits_entity.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/genre_entity.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/language_entity.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:tmdb_movies/features/notifications/services/firebase_cloud_messaging_service.dart';
import 'package:tmdb_movies/firebase_options.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
) async {
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (kDebugMode) {
      log(details.exceptionAsString(), stackTrace: details.stack);
    }
  };

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      await dotenv.load();

      await Hive.initFlutter();
      
      Hive
        ..registerAdapter(ActorAdapter())
        ..registerAdapter(CreditsAdapter())
        ..registerAdapter(GenreAdapter())
        ..registerAdapter(LanguageAdapter())
        ..registerAdapter(MovieDetailsAdapter());
      
      await Hive.openBox<MovieDetails>('movies');
      
      await initializeServiceLocators();

      if (kDebugMode) {
        final String? fcmToken = await sl<FirebaseCloudMessagingService>().getFcmToken();

        log('FCM token: $fcmToken', name: 'FCM');
      }

      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description:  'This channel is used for important notifications.', // description
        importance: Importance.max,
      );

      final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

      await sl<FirebaseCloudMessagingService>().requestPermission();

      sl<FirebaseCloudMessagingService>().listenToForegroundNotifications((RemoteMessage message) {
        final RemoteNotification? notification = message.notification;
        final AndroidNotification? android = message.notification?.android; 
        
        // If `onMessage` is triggered with a notification, construct our own
        // local notification to show to users using the created channel.
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: '@mipmap/ic_launcher',
              ),
            ),
          );
        }
      });

      runApp(
        await builder(),
      );
    },
    (Object error, StackTrace stackTrace) async {
      if (kDebugMode) {
        log(error.toString(), stackTrace: stackTrace);
      }
    },
  );
}
