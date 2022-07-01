import 'package:flutter/material.dart';
import 'package:login_register/first.dart';
import 'package:login_register/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [ChangeNotifierProvider<Auth>(create: (_) => Auth())],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: First());
  }
}
