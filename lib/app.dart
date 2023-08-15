import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'screens/list_screen.dart';

class App extends StatefulWidget {

  const App({Key? key, }) :super(key: key);  // this.preferences

  static const String title = 'Wasteagram';

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {

  static Future<void> reportError(dynamic error, dynamic stackTrace) async {
    final sentryId =
        await Sentry.captureException(error, stackTrace: stackTrace);
    sentryId.toString();
  }

  @override
  Widget build(BuildContext context) {
    // throw StateError('Example Error!');
    return GestureDetector(
      onTap: () {FocusManager.instance.primaryFocus?.unfocus();},
      child: MaterialApp(
        title: App.title,
        theme: ThemeData.dark(),
        home: ListScreen()
      ),
    );  
  }

}
