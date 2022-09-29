import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:painting_app/widgets/product_widget.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
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
            top: 35,
            child: Text(
              'PaintingStyle',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          //Choose your painting style
          Positioned(
            top: 72,
            left: 0,
            right: 0,
            child: Text(
              'Choose your painting style',
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
                  .collection('Paintings')
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
                        return  ProductWidget(
                          document['urlImage'],
                          document['productName'],
                          document['productPrice'],
                          document['ownerName'],
                          document['details'],
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
}

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
