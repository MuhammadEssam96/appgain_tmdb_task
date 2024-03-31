import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

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
