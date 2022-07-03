import 'package:eat_easy_app/logic/app_storage.dart';
import 'package:eat_easy_app/ui/routes/register_routes.dart';
import 'package:eat_easy_app/utils/utils.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'ui/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
      SystemUiOverlay.top,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashscreen,
      builder: (_, child) {
        return ChangeNotifierProvider<AppStorage>(
          create: (_) => AppStorage(),
          child: AppState(
            child: Toast(
              navigatorKey: navigatorKey,
              child: child!,
            ),
          ),
        );
      },
    );
  }
}
