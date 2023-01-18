import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/Screens/forgotPassword.dart';
import 'package:mobile_app/Screens/home_screen.dart';
import 'package:mobile_app/Screens/registerationScreen.dart';
import 'package:provider/provider.dart';

import 'google-Auth/googleAuthentication.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  bool showPassword = false;
  bool checkedValue = true;

  final form = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> login() async {
    try {
      final user = (await _auth.signInWithEmailAndPassword(
              email: email.text, password: password.text))
          .user;
      if (user != null) {
        print("login success");
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: form,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // showPassword ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginScreen(),
                                ),
                              );
                            });
                          },
                          child: Text("SIGN IN",
                              style: TextStyle(
                                  color: Colors.deepOrangeAccent,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline))),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      RegistrationScreen(),
                                ),
                              );
                            });
                          },
                          child: Text("SIGN UP",
                              style: TextStyle(
                                  color: Colors.deepOrangeAccent,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline))),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: email,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "email is required";
                          } else if (value != "email") {
                            return "Invalid email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[350],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.email),
                            hintText: "Enter your email"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: password,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "password is required";
                          } else if (value != "password") {
                            return "Invalid password";
                          }
                          return null;
                        },
                        obscureText: showPassword ? false : true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[350],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Enter your password",
                          suffixIcon: showPassword
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  child: Icon(Icons.visibility))
                              : InkWell(
                                  onTap: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  child: Icon(Icons.visibility_off),
                                ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: CheckboxListTile(
                        title: Text(
                          "Keep me signed in",
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontSize: 18,
                            fontFamily: 'roboto',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        value: checkedValue,
                        onChanged: (newValue) {
                          setState(() {
                            checkedValue = newValue!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ],
                ),

                InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ForgotPassword(),
                      ));
                    }),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      if (form.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Successfully logged in")));
                        print("Valid form");
                      } else {
                        print("Invalid form");
                      }
                      // final provider =
                      //     Provider.of<GoogleSignInProvider>(context, listen: false);
                      // provider.logout();
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => HomeScreen(),
                      //     ),
                      //     (Route<dynamic> route) => false);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        fixedSize: const Size(150, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: RichText(
                    text: TextSpan(
                      text: "Dont have an account? ",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent,
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      RegistrationScreen(),
                                ),
                              );
                            },
                        )
                      ],
                    ),
                  ),
                ),
                Text(
                  "or Login with ",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                    // height: constraints.maxHeight * 0.02,
                    ),
                TextButton(
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.googleLogin(context);
                  },
                  child: Image.asset(
                    'assets/images/1.png',
                    height: 60,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ValidateLogin {
  static String? emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    return null;
  }
}
