//TODO: upgrade pod version in podfile to 11 and perform pod install

import 'package:connectr/colors.dart';
import 'package:connectr/common/widgets/error.dart';
import 'package:connectr/common/widgets/loader.dart';
import 'package:connectr/features/auth/controller/auth_controller.dart';
import 'package:connectr/features/landing/screens/landing_screen.dart';
import 'package:connectr/firebase_options.dart';
import 'package:connectr/router.dart';
import 'package:connectr/screens/mobile_screen_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: false).copyWith(
          scaffoldBackgroundColor: backgroundColorDarkOld,
          appBarTheme: const AppBarTheme(
            backgroundColor: appBarColorDarkOld,
          )),
      home: ref.watch(userDataAuthProvider).when(
            data: (user) {
              if (user == null) {
                return const LandingScreen();
              }
              return const MobileScreenLayout();
            },
            error: (err, trace) {
              return ErrorScreen(
                error: err.toString(),
              );
            },
            loading: () => const Loader(),
          ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
