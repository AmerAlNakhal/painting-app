import 'package:flutter/material.dart';
import 'package:painting_app/screens/Payment_screen.dart';
import 'package:painting_app/screens/add_painting_screen.dart';
import 'package:painting_app/screens/delete_peoduct_screen.dart';
import 'package:painting_app/screens/home_screen.dart';
import 'package:painting_app/screens/launch_screen.dart';
import 'package:painting_app/screens/cart_item_screen.dart';
import 'package:painting_app/screens/login_screen.dart';
import 'package:painting_app/screens/payment_success_screen.dart';
import 'package:painting_app/screens/products_screen.dart';
import 'package:painting_app/screens/rate_screen.dart';
import 'package:painting_app/screens/search_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      initialRoute: 'Launch',
      routes: {
        'Launch': (context) => LaunchScreen(),
        'Login': (context) => LoginScreen(),
        'Home' : (context) => HomeScreen(),
        'Products': (context) => ProductsScreen(),
        'DeleteProduct' : (context) => DeleteProductsScreen(),
        'Likes' : (context) => CartScreen(),
        'Search': (context) => SearchScreen(),
        'AddPainting' : (context) => AddPaintingScreen(),
        'PaymentScreen' : (context) => PaymentScreen(),
        'PaymentSuccess' : (context) => PaymentSuccessScreen(),
        'Rate' : (context) => RateScreen(),
      },
    );
  }
}
