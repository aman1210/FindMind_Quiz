import 'package:findmind_task/provider/quizProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:findmind_task/screens/quizScreen.dart';
import 'package:findmind_task/screens/scoreScreen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => QuizProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'FindMind Quiz App Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // return QuizScreen();
              return Consumer<QuizProvider>(
                builder: (context, value, child) {
                  return FutureBuilder(
                    future: value.loadProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done)
                        return QuizScreen();
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
