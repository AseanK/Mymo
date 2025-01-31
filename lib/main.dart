import 'package:flutter/material.dart';
import 'package:mymo/pages/home.dart';
import 'package:mymo/components/constants.dart';
import 'package:mymo/providers/image_provider.dart';
import 'package:mymo/providers/time_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CustomImageProvider()),
    ChangeNotifierProvider(create: (_) => TimeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: kBgColor),
      title: 'MyMo',
      home: const HomePage(),
    );
  }
}
