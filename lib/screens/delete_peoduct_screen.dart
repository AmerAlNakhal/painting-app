import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:painting_app/controller/painting_firestore_controller.dart';
import 'package:painting_app/widgets/helper.dart';
import 'package:painting_app/widgets/product_widget.dart';

class DeleteProductsScreen extends StatefulWidget {
  @override
  _DeleteProductsScreenState createState() => _DeleteProductsScreenState();
}

class _DeleteProductsScreenState extends State<DeleteProductsScreen> {
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
            top: 55,
            child: Text(
              'DeletePainting',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          //Tap to delete
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Text(
              'Tap to delete',
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
              top: 100,
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
                        return GestureDetector(
                          onTap: () async {
                            await deleteProduct(document.id);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              image: DecorationImage(
                                image: NetworkImage(
                                  document['urlImage'],
                                ),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.elliptical(40, 90),
                                topLeft: Radius.elliptical(90, 40),
                                bottomRight: Radius.elliptical(90, 40),
                                bottomLeft: Radius.elliptical(40, 90),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 5,
                                      right: 5,
                                      bottom: 5,
                                      child: Container(
                                        width: 142,
                                        height: 59,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Colors.black54,
                                            Colors.white60,
                                          ]),
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(
                                            color: Colors.black54,
                                            width: 1,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: 9,
                                            right: 9,
                                            top: 6,
                                            // bottom: 6,
                                          ),
                                          //Product(Name&Price&Owner)
                                          child: Column(
                                            children: [

                                              //Name & Price
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  //ProductName
                                                  Text(
                                                    document['productName'],
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                  //ProductPrice
                                                  Text(
                                                    document['productPrice'],
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              //Divider
                                              Divider(
                                                color: Colors.black,
                                                thickness: 1,
                                              ),
                                              //Owner
                                              Row(
                                                children: [
                                                  //OwnerImage
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.black54,
                                                        border: Border.all(
                                                          color: Colors.white,
                                                          width: 1,
                                                        ),
                                                        borderRadius: BorderRadius.circular(20)),
                                                    child: CircleAvatar(
                                                      child: Image(
                                                        image: AssetImage(
                                                          'images/7.png',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      radius: 8,
                                                    ),
                                                  ),
                                                  //SizedBox(5)
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  //OwnerName
                                                  Text(
                                                    document['ownerName'],
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
    bool deleted = await PaintingFireStoreController.instance.delete(id);
    if (deleted) {
      HelperS.showMessage(context, 'Delete successfully...');
    } else {
      HelperS.showMessage(context, 'Delete Failed...');
    }
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
