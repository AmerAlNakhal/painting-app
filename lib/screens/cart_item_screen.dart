import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:painting_app/controller/cart_firestore_controller.dart';
import 'package:painting_app/controller/painting_firestore_controller.dart';
import 'package:painting_app/widgets/helper.dart';
import 'package:painting_app/widgets/cart_widget.dart';
import 'package:painting_app/widgets/product_widget.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Title
          Positioned(
            left: 0,
            right: 0,
            top: 30,
            child: Text(
              'Cart',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          //Paintings has been Shopping
          Positioned(
            top: 63,
            left: 0,
            right: 0,
            child: Text(
              'Paintings has been Shopping',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black26,
                fontWeight: FontWeight.bold,
                fontSize: 9,
              ),
            ),
          ),
          //DoubleTap to delete
          Positioned(
            top: 75,
            left: 0,
            right: 0,
            child: Text(
              'DoubleTap to delete',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black26,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          //Products
          Padding(
            padding: EdgeInsets.only(
              top: 75,
              left: 10,
              right: 10,
            ),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Cart')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error...'),
                  );
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new Container(
                      child: Center(
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: CupertinoActivityIndicator(),
                        ),
                      ),
                    );
                  default:
                    return new GridView(
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 80 / 120,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        return GestureDetector(
                          onDoubleTap: () async {
                            await deleteProduct(document.id);
                          },
                          child: CartWidget(
                            document['urlImage'],
                            document['productName'],
                            document['productPrice'],
                            document['ownerName'],
                            document['details'],
                          ),
                        );
                      }).toList(),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future deleteProduct(String id) async {
    await CartFireStoreController.instance.delete(id);
  }
}

class Helper {}

/*

GridView(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 80 / 120,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                children: [
                  ProductWidget(
                    'images/2.png',
                    'Inner calm',
                    '\$2100',
                    'images/7.png',
                    'Farbod M Mehr',
                  ),
                  ProductWidget(
                    'images/1.png',
                    'Anâr - Qajar',
                    '\$900',
                    'images/7.png',
                    'Farbod M Mehr',
                  ),
                  ProductWidget(
                    'images/4.png',
                    'La Graznde Gue',
                    '\$2500',
                    'images/7.png',
                    'Farbod M Mehr',
                  ),
                  ProductWidget(
                    'images/3.png',
                    'Qajari route V1',
                    '\$800',
                    'images/7.png',
                    'Farbod M Mehr',
                  ),
                  ProductWidget(
                    'images/5.png',
                    'Qajari route V1',
                    '\$200',
                    'images/7.png',
                    'Farbod M Mehr',
                  ),
                  ProductWidget(
                    'images/6.png',
                    'Qajari route V1',
                    '\$199',
                    'images/7.png',
                    'Farbod M Mehr',
                  ),
                ]),

 */
