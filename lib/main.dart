import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:praktikum_pertemuan_9/screen/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAw8Q7_MuowtbhKzreHbywIzgKZVD0Feis",
        appId: "1:1063454844450:web:1ecbb094897f91c6228c7b",
        messagingSenderId: "1063454844450",
        projectId: "fir-flutter-c2796"),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth Demo',
      home: AuthScreen(),
    );
  }
}
