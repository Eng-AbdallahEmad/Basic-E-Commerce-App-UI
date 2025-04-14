import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/screens/forget_screen.dart';
import 'package:ecommerce/screens/navigation_screen.dart';
import 'package:ecommerce/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _emailFocused = false;
  bool _passwordFocused = false;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();

    _emailFocusNode.addListener(() {
      setState(() {
        _emailFocused = _emailFocusNode.hasFocus;
      });
    });

    _passwordFocusNode.addListener(() {
      setState(() {
        _passwordFocused = _passwordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              Image.asset('assets/images/freed.png'),
              SizedBox(height: 40,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    TextFormField(
                      focusNode: _emailFocusNode,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Enter Email',
                        labelStyle: TextStyle(
                          color: _emailFocused ? Colors.black : Colors.grey,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Constant.primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: _emailFocused ? Colors.black : Colors.grey,
                        ),
                      ),
                      style: TextStyle(color: _emailFocused ? Colors.black : Colors.grey,),
                      cursorColor: Colors.black,
                    ),

                    SizedBox(height: 20,),

                    TextFormField(
                      obscureText: !_isPasswordVisible,
                      focusNode: _passwordFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Enter Password',
                        labelStyle: TextStyle(
                          color: _passwordFocused ? Colors.black : Colors.grey,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Constant.primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: _passwordFocused ? Colors.black : Colors.grey,
                        ),
                        suffixIcon: _passwordFocused
                            ? IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                          color: _passwordFocused ? Colors.black : Colors.grey,
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        )
                            : null,
                      ),
                      style: TextStyle(color: _passwordFocused ? Colors.black : Colors.grey,),
                      cursorColor: Colors.black,
                    ),

                    SizedBox(height: 10,),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForgetScreen()),
                          );
                        },
                        child: Text(
                          'Forget Password',
                          style: TextStyle(
                            color: Constant.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30,),

                    ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NavigationScreen(),
                          )
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(55),
                        backgroundColor: Constant.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 5,),
                        TextButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignupScreen()),);
                          },
                          child: Text('Sign Up',
                            style: TextStyle(
                                color: Constant.primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
