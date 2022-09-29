import 'package:flutter/material.dart';
import 'package:painting_app/controller/cart_firestore_controller.dart';
import 'package:painting_app/models/cart.dart';




class CartDetailsScreen extends StatefulWidget {
  final String productImg;
  final String productName;
  final String productPrice;
  final String ownerImg;
  final String ownerName;
  final String details;

  CartDetailsScreen({
    required this.productImg,
    required this.productName,
    required this.productPrice,
    required this.ownerImg,
    required this.ownerName,
    required this.details,
  });

  @override
  _CartDetailsScreenState createState() => _CartDetailsScreenState();
}

Color colorS = Colors.black26;
bool click = false;
bool like = false;

class _CartDetailsScreenState extends State<CartDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //ProductImg
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            child: Container(
              width: 375,
              height: 700,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.productImg,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          //ProductDetails
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: 375,
              height: 298,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              //Product(Name&Price&Owner)
              child: Padding(
                padding: EdgeInsets.only(
                  top: 19,
                  right: 25,
                  left: 25,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //Name & Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //ProductName
                          Text(
                            widget.productName,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          //ProductPrice
                          Text(
                            widget.productPrice,
                            style: TextStyle(
                              color: Color(0xAF47292A),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      //Divider
                      Divider(
                        color: Color(0xAFA8A8A8),
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
                                  widget.ownerImg,
                                ),
                                fit: BoxFit.cover,
                              ),
                              radius: 15,
                            ),
                          ),
                          //SizedBox(5)
                          SizedBox(
                            width: 5,
                          ),
                          //OwnerName
                          Text(
                            widget.ownerName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                            ),
                          ),
                        ],
                      ),
                      //SizedBox(10)
                      SizedBox(
                        height: 10,
                      ),
                      //Details
                      Text(
                        widget.details,
                        style: TextStyle(
                          color: Color(0xAF9D9DA8),
                          fontSize: 18,
                        ),
                      ),
                      //SizedBox(45)
                      SizedBox(
                        height: 45,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future store() async {
    await CartFireStoreController.instance.create(getCart());
  }

  Cart getCart() {
    return Cart(
      id: '',
      urlImage: widget.productImg,
      productName: widget.productName,
      productPrice: widget.productPrice,
      ownerName: widget.ownerName,
      details: widget.details,
      like: like,
    );
  }
}
