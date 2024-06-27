

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  var phoneNumberInput =null;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 83, 185, 216),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(

            children: [
              const Text('Lets Get Started',style: TextStyle(color: Colors.white),),

              // TextField(
              //   controller: _phoneNumberController,
              //   maxLength: 13,
              //   decoration: const InputDecoration(
              //     label: Text('enter your mobile number'),
              //   ),
              // ),

              SizedBox(height: 100,),

              IntlPhoneField(
                keyboardType: TextInputType.phone,

                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)

                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  phoneNumberInput=phone.completeNumber;
                },
              ),


              ElevatedButton(



                onPressed: () async {
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
                    phoneNumber: phoneNumberInput.toString(),
                  );
                },
                child: const Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
