import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'OTP_screen.dart';

class PhoneNoAuth extends StatefulWidget {
  const PhoneNoAuth({super.key});

  @override
  State<PhoneNoAuth> createState() {
    return _PhoneNoAuthState();
  }
}

class _PhoneNoAuthState extends State<PhoneNoAuth> {
  final _phoneNumberController = TextEditingController();
  var phoneNumberInput = null;
  String phoneNo = "+91";

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 83, 185, 216),
        ),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 28, top: 115),
                  child: Text(
                    'Enter Your\nPhone Number',
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Container(
                height: 45,
                width: 325,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(171, 255, 255, 255),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    autofocus: true,
                    controller: _phoneNumberController,
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 130, 130, 130),
                          fontSize: 19,
                          fontWeight: FontWeight.normal),
                      hintText: 'Phone No.',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(174, 0, 87, 115),
                  elevation: 0.1,
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Colors.transparent, // Border color
                      width: 0.5, // B
                      // order width
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30, // Icon color
                ),

                onPressed: () async {
                  phoneNo = phoneNo + _phoneNumberController.text.toString();
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException ex) {},
                    codeSent: (String verificationid, int? resendToken) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(
                            verificationID: verificationid,
                          ),
                        ),
                      );
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                    phoneNumber: phoneNo.toString(),
                  );
                },
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                    'assets/hand-drawn-dog-outline-illustration_23-2149263522-removebg-preview.png',
                    width: 300,
                    color: const Color.fromARGB(223, 255, 255, 255)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
