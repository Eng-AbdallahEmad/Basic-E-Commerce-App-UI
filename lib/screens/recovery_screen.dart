import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/screens/navigation_screen.dart';
import 'package:flutter/material.dart';

class RecoveryScreen extends StatefulWidget {
  const RecoveryScreen({super.key});

  @override
  State<RecoveryScreen> createState() => _RecoveryScreenState();
}

class _RecoveryScreenState extends State<RecoveryScreen> {
  final FocusNode _resetCodeFocusNode = FocusNode();
  bool _resetCodeFocused = false;
  final FocusNode _passwordFocusNode = FocusNode();
  bool _passwordFocused = false;
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  bool _confirmPasswordFocused = false;

  final _resetCodeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();

    _resetCodeFocusNode.addListener(() {
      setState(() {
        _resetCodeFocused = _resetCodeFocusNode.hasFocus;
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
    _resetCodeFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _resetCodeController.dispose();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),

              Text(
                'Forget Password',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 50,),

              TextFormField(
                controller: _resetCodeController,
                focusNode: _resetCodeFocusNode,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Reset Code',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Constant.primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelStyle: TextStyle(
                      color: _resetCodeFocused ? Colors.black : Colors.grey),
                  prefixIcon: Icon(
                    Icons.numbers_outlined,
                    color: _resetCodeFocused ? Colors.black : Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(
                  color: _resetCodeFocused ? Colors.black : Colors.grey,
                ),
              ),

              SizedBox(height: 20,),

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

              SizedBox(height: 20,),

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

              SizedBox(height: 40,),

              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NavigationScreen()),
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
                  'Reset Password',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
