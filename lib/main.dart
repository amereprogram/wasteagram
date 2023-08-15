import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'app.dart';

const DSN_URL =
    'https://007c89f26bcb46c2bee3bfc8be095d21@o4504861244063744.ingest.sentry.io/4504861270933504';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await SentryFlutter.init(
      (options) {
        options.dsn = DSN_URL;
        options.tracesSampleRate = 1.0;
      },
    
    appRunner: () => runApp(const App()),  // preferences: await SharedPreferences.getInstance())
  );
}


