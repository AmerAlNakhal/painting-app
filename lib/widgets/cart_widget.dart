import 'package:flutter/material.dart';
import 'package:painting_app/screens/cart_details_screen.dart';
import 'package:painting_app/screens/cart_item_screen.dart';
import 'package:painting_app/screens/product_details_screen.dart';

class CartWidget extends StatelessWidget {
  String productImg;
  String? productName;
  String? productPrice;
  String ownerImg = 'images/7.png';
  String? ownerName;
  String? details;
  Color? color;

  CartWidget(this.productImg, this.productName, this.productPrice,
      this.ownerName, this.details,
      {this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartDetailsScreen(
              productImg: productImg,
              productName: productName!,
              productPrice: productPrice!,
              ownerImg: ownerImg,
              ownerName: ownerName!,
              details: details!,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          image: DecorationImage(
            image: NetworkImage(
              productImg,
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
                      gradient: LinearGradient(
                        colors: [
                          Colors.white54,
                          Colors.white38,
                          Colors.black26,
                          Colors.white38,
                          Colors.black26,
                          Colors.white70,
                        ],
                        tileMode: TileMode.decal,
                      ),
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
                                productName!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                              //ProductPrice
                              Text(
                                productPrice!,
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
                                      ownerImg,
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
                                ownerName!,
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
  }
}
