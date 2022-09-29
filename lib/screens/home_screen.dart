import 'package:flutter/material.dart';
import 'package:painting_app/screens/add_painting_screen.dart';
import 'package:painting_app/screens/cart_item_screen.dart';
import 'package:painting_app/screens/products_screen.dart';
import 'package:painting_app/screens/search_screen.dart';
import 'package:painting_app/screens/settings_screen.dart';

import 'delete_peoduct_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cidnex = 0;
  int _x = 0;
  List<Widget> _screens = [
    ProductsScreen(),
    SearchScreen(),
    CartScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context)=>AddPaintingScreen(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.redAccent,
          size: 30,
        ),
        backgroundColor: Colors.black87,
        elevation: 5,
        isExtended: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        elevation: 20,
        notchMargin: 5,
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //Products
              GestureDetector(
                onTap: () {
                  setState(() {
                    _x = 0;
                  });
                },
                child: Icon(
                  _x == 0 ? Icons.home : Icons.home_outlined,
                  color: _x == 0 ? Colors.black : Colors.black54,
                  size: 30,
                ),
              ),
              //Search
              GestureDetector(
                onTap: () {
                  setState(() {
                    _x = 1;
                  });
                },
                child: Icon(
                  Icons.search,
                  color: _x == 1 ? Colors.black : Colors.black54,
                  size: 30,
                ),
              ),
              //Cart
              GestureDetector(
                onTap: () {
                  setState(() {
                    _x = 2;
                  });
                },
                child: Icon(
                  _x == 2 ? Icons.shopping_cart : Icons.shopping_cart_outlined,
                  color: _x == 2 ? Colors.black : Colors.black54,
                  size: 30,
                ),
              ),
              //Settings
              GestureDetector(
                onTap: () {
                  setState(() {
                    _x = 3;
                  });
                },
                child: Icon(
                  _x == 3 ? Icons.settings : Icons.settings_outlined,
                  color: _x == 3 ? Colors.black : Colors.black54,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      body: _screens.elementAt(_x),
    );
  }
}
