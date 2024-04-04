import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tmdb_movies/di.dart';

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

      await dotenv.load();
      
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
