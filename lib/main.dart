import 'package:blog_app_web/BLoC/PostCubit.dart';
import 'package:blog_app_web/home/HomePage.dart';
import 'package:blog_app_web/repositories/PostRepository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  kIsWeb
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyDeQ8grjv7B6en_Zso1wHntB-7MnMOzNdg",
              authDomain: "blog-web-app-d9f57.firebaseapp.com",
              projectId: "blog-web-app-d9f57",
              storageBucket: "blog-web-app-d9f57.appspot.com",
              messagingSenderId: "1074056054056",
              appId: "1:1074056054056:web:ca6008197c3655bad33c1d",
              measurementId: "G-QGCVYH36C8"),
        )
      : await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    home: BlocProvider(
      create: (context) => PostCubit(postsRepository: PostRepository()),
      child: const Home(),
    ),
    theme: ThemeData(
      primarySwatch: Colors.red,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    debugShowCheckedModeBanner: false,
  ));
}
