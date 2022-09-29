import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:painting_app/controller/firebase_auth_controller.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp();
    Future.delayed(Duration(seconds: 3),(){
      String loggedIn = FirebaseAuthController.instance.isLoggedIn()?'Home':'Login';
      Navigator.pushReplacementNamed(context, loggedIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'images/launch_image.jpg',
              ),
              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.saturation),
            ),
          ),
        ),
      ),
    );
  }
}
