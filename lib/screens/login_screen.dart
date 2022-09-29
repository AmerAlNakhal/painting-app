import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:painting_app/controller/firebase_auth_controller.dart';
import 'package:painting_app/screens/settings_screen.dart';
import 'package:painting_app/widgets/helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? _emailController;
  TextEditingController? _passController;
  bool show = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController!.dispose();
    _passController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Email
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Email...',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black45,
                    ),
                    prefixIcon: Icon(
                      Icons.drive_file_rename_outline,
                      color: Colors.black45,
                      size: 25,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                  ),
                ),
                //SizedBox(10)
                SizedBox(
                  height: 10,
                ),
                //Password
                TextField(
                  controller: _passController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: show ? false : true,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Password...',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black45,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black45,
                      size: 25,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          show = !show;
                        });
                      },
                      child: Icon(
                        show
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                        color: show ? Colors.red : Colors.grey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
                //SizedBox(10)
                SizedBox(
                  height: 10,
                ),
                //Login
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      await performLogin();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      primary: Colors.blueGrey,
                    ),
                  ),
                ),
                //SizedBox(10)
                SizedBox(
                  height: 10,
                ),
                //Create
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      await performCreate();
                    },
                    child: Text(
                      'Create',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      primary: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future performLogin() async {
    if (checkData()) await login();
  }

  Future performCreate() async {
    if (checkData()) await create();
  }

  Future create() async {
    UserCredential? userCredential = await FirebaseAuthController.instance
        .setContext(context)
        .createAccount(_emailController!.text, _passController!.text);
    if (userCredential != null) {
      HelperS.showMessage(context, 'Account created successfully...');
      Navigator.pushReplacementNamed(context, 'Home');
    }
  }

  Future login() async {
    UserCredential? userCredential = await FirebaseAuthController.instance
        .setContext(context)
        .signIn(_emailController!.text, _passController!.text);
    if (userCredential != null) {
      Navigator.pushReplacementNamed(context, 'Home');
    }
  }

  bool checkData() {
    if (_emailController!.text.isNotEmpty && _passController!.text.isNotEmpty) {
      return true;
    }
    HelperS.showMessage(context, 'Enter email & password...', error: true);
    return false;
  }
}
