import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FocusNode _nameFocusNode = FocusNode();
  bool _nameFocused = false;
  final FocusNode _emailFocusNode = FocusNode();
  bool _emailFocused = false;
  final FocusNode _phoneFocusNode = FocusNode();
  bool _phoneFocused = false;
  final FocusNode _passwordFocusNode = FocusNode();
  bool _passwordFocused = false;
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  bool _confirmPasswordFocused = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();

    _nameFocusNode.addListener(() {
      setState(() {
        _nameFocused = _nameFocusNode.hasFocus;
      });
    });

    _emailFocusNode.addListener(() {
      setState(() {
        _emailFocused = _emailFocusNode.hasFocus;
      });
    });

    _phoneFocusNode.addListener(() {
      setState(() {
        _phoneFocused = _phoneFocusNode.hasFocus;
      });
    });

    _passwordFocusNode.addListener(() {
      setState(() {
        _passwordFocused = _passwordFocusNode.hasFocus;
      });
    });

    _confirmPasswordFocusNode.addListener(() {
      setState(() {
        _confirmPasswordFocused = _confirmPasswordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  bool _validateForm() {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      return false;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Image.asset('assets/images/freed.png'),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      focusNode: _nameFocusNode,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Enter Name',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Constant.primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelStyle: TextStyle(
                            color: _nameFocused ? Colors.black : Colors.grey),
                        prefixIcon: Icon(
                          Icons.person_outlined,
                          color: _nameFocused ? Colors.black : Colors.grey,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(
                        color: _nameFocused ? Colors.black : Colors.grey,
                      ),
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Constant.primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelText: 'Enter Email',
                        labelStyle: TextStyle(
                            color: _emailFocused ? Colors.black : Colors.grey),
                        prefixIcon: Icon(
                            Icons.email_outlined,
                            color: _emailFocused ? Colors.black : Colors.grey),
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(
                        color: _emailFocused ? Colors.black : Colors.grey,
                      ),
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      controller: _phoneController,
                      focusNode: _phoneFocusNode,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Constant.primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelText: 'Enter Phone',
                        labelStyle: TextStyle(
                          color: _phoneFocused ? Colors.black : Colors.grey,
                        ),
                        prefixIcon: Icon(
                          Icons.phone_android_outlined,
                          color: _phoneFocused ? Colors.black : Colors.grey,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(
                        color: _phoneFocused ? Colors.black : Colors.grey,
                      ),
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      obscureText: _obscurePassword,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Constant.primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelText: 'Enter Password',
                        labelStyle: TextStyle(
                            color: _passwordFocused ? Colors.black : Colors.grey),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: _passwordFocused ? Colors.black : Colors.grey,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: _togglePasswordVisibility,
                          child: Icon(
                            _obscurePassword
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off_outlined,
                            color: _passwordFocused ? Colors.black : Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(
                        color: _passwordFocused ? Colors.black : Colors.grey,
                      ),
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      controller: _confirmPasswordController,
                      focusNode: _confirmPasswordFocusNode,
                      obscureText: _obscureConfirmPassword,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Constant.primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(
                            color: _confirmPasswordFocused
                                ? Colors.black
                                : Colors.grey),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: _confirmPasswordFocused
                              ? Colors.black
                              : Colors.grey,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: _toggleConfirmPasswordVisibility,
                          child: Icon(
                            _obscureConfirmPassword
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off_outlined,
                            color: _confirmPasswordFocused
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(
                        color: _confirmPasswordFocused ? Colors.black : Colors.grey,
                      ),
                    ),

                    SizedBox(height: 30),

                    ElevatedButton(
                      onPressed: _validateForm()
                          ? () {
                        // Handle form submission
                      }
                          : null,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(55),
                        backgroundColor: Constant.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Constant.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
