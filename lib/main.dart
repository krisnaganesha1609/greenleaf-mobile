import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greenleaf/views/onboarding/onboarding.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenleaf/environment/env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 119, 244, 70),
      statusBarIconBrightness: Brightness.light));
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Supabase.initialize(
      url: Env.supabaseUrl, anonKey: Env.supabasePublicKey);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GreenLeaf',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Mulish"),
        home: ScrollConfiguration(
          behavior: MyBehavior(),
          child: const OnBoardingScreen(),
        ));
  }
}

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
