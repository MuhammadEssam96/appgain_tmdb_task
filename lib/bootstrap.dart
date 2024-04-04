import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tmdb_movies/di.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/actor_entity.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/credits_entity.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/genre_entity.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/language_entity.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/movie_details_entity.dart';
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
