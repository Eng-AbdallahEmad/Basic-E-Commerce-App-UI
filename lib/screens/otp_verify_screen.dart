import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPVerifyScreen extends StatelessWidget {
  const OTPVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 10,),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Enter the OTP we have sent you to your number',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),

              SizedBox(height: 40,),

              OtpTextField(
                numberOfFields: 5,
                borderColor: Constant.primaryColor,
                focusedBorderColor: Constant.primaryColor,
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                onSubmit: (String verificationCode){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      }
                  );
                }, // end onSubmit
              ),
            ],
          ),
        ),
      ),
    );
  }
}
