import 'dart:ffi';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:original_pupup/User_Name.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key, required this.verificationID});

  String verificationID;

  @override
  State<OtpScreen> createState() {
    return _OTPScreenState();
  }
}

class _OTPScreenState extends State<OtpScreen> {
  final _OTPController = TextEditingController();

  @override
  void dispose() {
    _OTPController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var otpValue = null;
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(108, 255, 255, 255),
        border: Border.all(color: Colors.transparent),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 83, 185, 216),
        ),

            width: double.infinity,
            padding: EdgeInsets.only(top: 300),
      
            child: Column(

              children: [
                Pinput(
                  keyboardType: TextInputType.phone,
                  autofocus: true,
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: Colors.white),
                    ),
                  ),
                  onChanged: (value) {
                    otpValue=value;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential =
                          await PhoneAuthProvider.credential(
                              verificationId: widget.verificationID,
                              smsCode: otpValue.toString());
                      FirebaseAuth.instance
                          .signInWithCredential(credential)
                          .then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserName(),
                          ),
                        );
                      });
                    } catch (ex) {
                      log(ex.toString() as num);
                    }
                  },
                  child: const Text('OTP'),
                ),
              ],
            ),

      ),
    );
  }
}
