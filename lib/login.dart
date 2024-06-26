import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isFilled = false;

   void _checkFilled() {
    setState(() {
      _isFilled = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  Future<void> _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final bytes = utf8.encode(password);
    final hashedPassword = sha256.convert(bytes).toString();

    final url = 'https://apiv2stg.promilo.com/user/oauth/token';
    final headers = {
      'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    final body = {
      'username': email,
      'password': hashedPassword,
      'grant_type': 'password',
    };

    final response = await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
    } else {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid ID Password')),
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             SizedBox(height: 50.h),
              Text(
                'Promilo',
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 60.h),
              Text(
                'Hi, Welcome Back!',
                
                style:  TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50.h),
              
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                  'Please sign in to continue',
                  style: TextStyle(fontSize: 17.sp),
                ),
                ),
              ),
              
              
              SizedBox(height: 10.h),
              TextField(
        controller: _emailController,
        onChanged: (_) => _checkFilled(),
        decoration: InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Handle OTP sign in
                  },
                  child: Text(
                    'Sign in with OTP',
                    style: TextStyle(
                      fontSize: 18.sp,
                      
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                controller: _passwordController,
                onChanged: (_) => _checkFilled(),
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                      ),
                      const Text('Remember Me'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle forgot password
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontSize: 18.sp,
                      
                      color: Colors.purple,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              SizedBox(
            width: 380.w,
            height: 50.h,
            child: ElevatedButton(
              onPressed: _isFilled ? _login : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isFilled ? Colors.purple : Colors.grey,
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.blue),
              ),
                child: const Text('Submit'),
              ),
              ),
              SizedBox(height: 30.h),
              const Text('or'),
              SizedBox(height: 20.h),
              Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Expanded(
      child: Image.network(
        'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png',
        height: 40,
        fit: BoxFit.contain,
      ),
    ),
    Expanded(
      child: Image.network(
        'https://www.freepnglogos.com/uploads/linkedin-logo-design-30.png',
        height: 40,
        fit: BoxFit.contain,
      ),
    ),
    Expanded(
      child: Image.network(
        'https://www.freepnglogos.com/uploads/facebook-logo-icon/facebook-logo-icon-file-facebook-icon-svg-wikimedia-commons-4.png',
        height: 40,
        fit: BoxFit.contain,
      ),
    ),
    Expanded(
      child: Image.network(
        'https://www.freepnglogos.com/uploads/logo-ig-png/logo-ig-logo-instagram-ini-ada-varias-dan-transparan-33.png',
        height: 40,
        fit: BoxFit.contain,
      ),
    ),
    Expanded(
      child: Image.network(
        'https://www.freepnglogos.com/uploads/whatsapp-logo-png-31.png',
        height: 40,
        fit: BoxFit.contain,
      ),
    ),
  ],
),

              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Business User?',style: TextStyle(
                          fontSize: 16,
                      
                      color: Colors.grey,
                        )),
                      Text(
                        'Login Here',
                        style: TextStyle(
                          fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Don't have an account?",style: TextStyle(
                          fontSize: 16,
                      
                      color: Colors.grey,
                        ),),
                      Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              const Text(
                'By continuing you agree to Promilos',
                style: TextStyle(color: Colors.grey),
              ),
              const Text(
                'Terms of use & Privacy policy',
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}