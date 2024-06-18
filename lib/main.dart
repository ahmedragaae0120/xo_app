import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:xo_app/ui/game_screen.dart';
import 'package:xo_app/ui/providers/game_provider.dart';
import 'package:xo_app/ui/start_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => GameProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(600, 900),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            debugShowMaterialGrid: false,
            routes: {
              GameScreen.routeName: (context) => const GameScreen(),
              StartScreen.routeName: (context) => const StartScreen(),
            },
            initialRoute: StartScreen.routeName,
          );
        });
  }
}
