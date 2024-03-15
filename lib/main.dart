import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vsquareclasses/src/extensions/context_extension.dart';

import 'firebase_options.dart';
import 'src/config/routes/app_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    GoRouter.optionURLReflectsImperativeAPIs = true;
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoute().router,
      title: 'VSquare Classes',
      theme: ThemeData(
          filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: context.colorScheme.primary,
          )),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: context.colorScheme.inversePrimary,
          )),
    );
  }
}
