import 'package:flutter/material.dart';
import 'package:original_pupup/OTP_screen.dart';
import 'package:original_pupup/User_Name.dart';
import 'package:original_pupup/phone_screen.dart';
import 'package:original_pupup/pupup_startScreen.dart';
import 'package:original_pupup/signup_page.dart';



class PupStart extends StatefulWidget {
  const PupStart({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PupStartState();
  }
}

class _PupStartState extends State<PupStart> {
  var activeScreen = 'signUpPage';

  void switchScreen(String accept) {
    setState(() {
      activeScreen = accept;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = PupStartScreen(switchScreen);

    if (activeScreen == 'signUpPage') {
      screenWidget = SignUpPage(switchScreen);
    }

    if (activeScreen == 'phoneNumberScreen') {
      screenWidget = const PhoneNoAuth();
    }
    // if (activeScreen == 'otpscreen') {
    //   screenWidget = OtpScreen(verificationID: '123456');
    // }

    return Scaffold(
        body: screenWidget,
    );
  }
}
