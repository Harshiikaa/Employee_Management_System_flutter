import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/Screens/loginScreen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController phoneNumber = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            height: 200,
            width: 300,
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
                "Enter your phone number here, we’ll send a link to reset your password"),
            height: 100,
            width: 300,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: phoneNumber,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone_android),
                hintText: "Enter your phone number",
                filled: true,
                fillColor: Colors.grey[350],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => LoginScreen(),
                  ),
                );
              },
              child: Text("Send")),
          RichText(
            text: TextSpan(
              text: "Go back to ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
              children: [
                TextSpan(
                  text: "Sign In",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent,
                    fontSize: 18,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => LoginScreen(),
                        ),
                      );
                    },
                )
              ],
            ),
          ),
          // Container(
          //   margin: EdgeInsets.all(10),
          //   child: CheckboxListTile(
          //     title: Text("Go back to"),
          //     value: checkedValue,
          //     onChanged: (newValue) {
          //       setState(() {
          //         checkedValue = newValue;
          //       });
          //     },
          //     controlAffinity: ListTileControlAffinity.leading,
          //   ),
          // ),
          // InkWell(
          //   child: Text("Login"),
          //   onTap: () async {
          //     if (await canLaunch("url")) {
          //       await launch("url");
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
