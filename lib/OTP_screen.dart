import 'dart:math';

import 'package:flutter/material.dart';


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
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: _OTPController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: "enter the OTP",
                suffixIcon: Icon(Icons.phone),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: (){},
            // onPressed: () async {
            //   try {
            //     PhoneAuthCredential credential =
            //         await PhoneAuthProvider.credential(
            //             verificationId: widget.verificationID,
            //             smsCode: _OTPController.text.toString());
            //     FirebaseAuth.instance
            //         .signInWithCredential(credential)
            //         .then((value) {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => PupStart(),
            //         ),
            //       );
            //     });
            //   } catch (ex) {
            //     log(ex.toString() as num);
            //   }
            // },
            child: const Text('OTP'),
          ),
        ],
      ),
    );
  }
}
