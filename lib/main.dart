

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:original_pupup/OTP_screen.dart';
import 'package:original_pupup/pupup_start.dart';

import 'firebase_options.dart';


void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp(
    const MaterialApp(home: PupStart(),),
  );
}


