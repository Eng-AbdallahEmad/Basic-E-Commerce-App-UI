import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/screens/otp_screen.dart';
import 'package:ecommerce/screens/recovery_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {

  bool ctlButton = false;
  TextEditingController emailController = TextEditingController();

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
                  'Forget Password',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 50,),

              Text(
                'Please enter your email address, You will receive a link to create or set a new password via email.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500
                ),
              ),

              SizedBox(height: 30,),

              TextFormField(
                controller: emailController,
                onChanged: (val){
                  if(val != ''){
                    setState(() {
                      ctlButton = true;
                    });
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  suffix: InkWell(
                    onTap: (){
                      setState(() {
                        emailController.clear();
                      });
                    },
                    child: Icon(
                      CupertinoIcons.multiply_circle,
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Constant.primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),

              SizedBox(height: 40,),

              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecoveryScreen()),);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(55),
                  backgroundColor: Constant.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Send Code',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'OR',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OTPScreen()),
                      );
                    },
                    child: Text(
                      'Verify Using Number',
                      style: TextStyle(
                          color: Constant.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
