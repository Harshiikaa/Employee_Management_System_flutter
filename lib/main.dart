import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mobile_app/Screens/forgotPassword.dart';
import 'package:mobile_app/Screens/home_screen.dart';
import 'package:mobile_app/Screens/registerationScreen.dart';
import 'package:mobile_app/Screens/widgets/profile_screen.dart';
import 'package:mobile_app/viewModel/auth_viewmodel.dart';
import 'package:mobile_app/viewModel/global_ui_viewmodel.dart';
import 'package:provider/provider.dart';

import 'Screens/loginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(EmployeeManagementSystem());
}

class EmployeeManagementSystem extends StatelessWidget {
  const EmployeeManagementSystem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalUIViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        // ChangeNotifierProvider (create: (_) => CategoryViewModel()),
      ],
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: Center(
          child: Image.asset(
            "assets/images/loader.gif",
            height: 100,
            width: 100,
          ),
        ),
        child: Consumer<GlobalUIViewModel>(builder: (context, loader, child) {
          if (loader.isLoading) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
          return MaterialApp(
            title: "Sunday Management",
            theme: ThemeData(primarySwatch: Colors.blue),
            // home: const LoginScreen(),
            initialRoute: "/login",
            routes: {
              "/login": (BuildContext context) => LoginScreen(),
              "/register": (BuildContext context) => RegistrationScreen(),
              "/forgotPass": (BuildContext context) => ForgotPassword(),
              "/dashboard": (BuildContext context) => HomeScreen(),
              "/profile": (BuildContext context) => ProfileScreen(),
            },
          );
        }),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

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
