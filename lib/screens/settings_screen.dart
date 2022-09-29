import 'package:flutter/material.dart';
import 'package:painting_app/controller/firebase_auth_controller.dart';
import 'package:painting_app/screens/cart_item_screen.dart';
import 'package:painting_app/screens/delete_peoduct_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool switchV = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Title
              Padding(
                padding: EdgeInsets.only(
                  top: 3,
                ),
                child: Text(
                  'Settings',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              //Items
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    //Theme
                    SwitchListTile(
                      value: switchV,
                      onChanged: (value) {
                        setState(() {
                          switchV = !switchV;
                        });
                      },
                      title: Text(
                        'Theme (ComingSoon)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Light / Dark',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //Divider
                    Divider(
                      color: Colors.black,
                      thickness: .2,
                      height: 2,
                    ),
                    //Delete
                    ListTile(
                      title: Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Delete Paintings',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: GestureDetector(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DeleteProductsScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 15,
                          ),
                          child: Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    //Divider
                    Divider(
                      color: Colors.black,
                      thickness: .2,
                      height: 2,
                    ),
                    //Logout
                    ListTile(
                      leading: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: GestureDetector(
                        onTap: () async {
                          await logOut();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 15,
                          ),
                          child: Icon(
                            Icons.logout,
                            color: Colors.blueGrey,
                            size: 30,
                          ),
                        ),
                      ),
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

  Future logOut() async {
    await FirebaseAuthController.instance.signOut();
    Navigator.pushReplacementNamed(context, 'Login');
  }
}
