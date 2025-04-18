import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:github_search_flutter/home.dart';
import 'package:github_search_flutter/login.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GithubSearch',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) => HomePage()
      },
      localizationsDelegates: [
        FlutterQuillLocalizations.delegate,
      ],
    );
  }
}
