import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wegag/features/auth/presentation/pages/app.dart';
import 'package:wegag/firebase_options.dart';

void main() async {
  //for the firebase set up
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //runApp
  runApp(MyApp());
}
