import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/Screens/loginScreen.dart';

Future<void> main() async {
  runApp(const EmployeeManagementSystem());
}

class EmployeeManagementSystem extends StatelessWidget {
  const EmployeeManagementSystem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Sunday Management",
        theme: ThemeData(primarySwatch: Colors.blue),
        // home: const LoginScreen(),
        initialRoute: "/login",
        routes: {
          "/login": (BuildContext context) => LoginScreen(),
        },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final form = GlobalKey<FormState>();

  int idx = 0;
  List<Widget> home = [
    LoginScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.message_sharp), label: "Message"),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time_filled), label: "Home")
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: idx,
          onTap: (index) {
            setState(() {
              idx = index;
            });
          },
        ),
        body: home[idx]);
  }
}
