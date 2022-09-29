import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:painting_app/widgets/helper.dart';
import 'package:painting_app/widgets/product_widget.dart';

import 'cart_details_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController? _searchController;
  bool isLoading = false;
  Map<String, dynamic> userMap = Map<String, dynamic>();

  void onSearch() async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    // setState(() {
    //   isLoading = true;
    // });
    await _fireStore
        .collection('Paintings')
        .where('productName', isEqualTo: _searchController!.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        // isLoading = false;
      });
      print(userMap);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController = TextEditingController();
    _searchController!.addListener(onSearch);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: isLoading
            ? Center(
                child: SpinKitDancingSquare(
                  color: Colors.black,
                  size: 100,
                ),
              )
            : SafeArea(
                child: Stack(
                  children: [
                    //Title
                    Positioned(
                      top: 3,
                      right: 0,
                      left: 0,
                      child: Text(
                        'Search',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    //Tap to Search
                    Positioned(
                      top: 35,
                      right: 0,
                      left: 0,
                      child: Text(
                        'Tap on button to Search',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    //SearchButton
                    Positioned(
                      top: 45,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: AnimSearchBar(
                            width: 400,
                            color: Colors.blueGrey.shade300,
                            animationDurationInMilli: 1000,
                            suffixIcon: Icon(
                              Icons.search_off_rounded,
                              color: Colors.black,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            helpText: 'Search...',
                            textController: _searchController!,
                            onSuffixTap: () async {
                              onSearch();
                              _searchController!.text = '';
                            },
                            closeSearchOnSuffixTap: true,
                          ),
                        ),
                      ),
                    ),
                    //SearchDetails
                    _searchController!.text.isEmpty
                        ? Center(
                            child: SpinKitDancingSquare(
                              color: Colors.black,
                              size: 100,
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                              top: 100,
                              right: 10,
                              left: 10,
                              bottom: 10,
                            ),
                            child: ListTile(
                              title: Text(
                                userMap['productName'] == null
                                    ? ''
                                    : userMap['productName'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                userMap['productPrice'] == null
                                    ? ''
                                    : userMap['productPrice'],
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: GestureDetector(
                                onTap: () {
                                  alertExit();
                                },
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: userMap['productPrice'] == null
                                      ? Colors.transparent
                                      : Colors.blueGrey,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
      ),
    );
  }

  void alertExit() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              side: BorderSide(
                color: Colors.black,
                width: 3,
              ),
            ),
            //Are you sure
            title: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 341,
                    height: 320,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 25,
                            ),
                            child: Column(
                              children: [
                                //ProductName
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    userMap['productName'] == null
                                        ? ''
                                        : userMap['productName'],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 35,
                                    ),
                                  ),
                                ),
                                //ProductPrice
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    userMap['productPrice'] == null
                                        ? ''
                                        : userMap['productPrice'],
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xAF47292A),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 35,
                                    ),
                                  ),
                                ),
                                //OwnerName
                                Text(
                                  userMap['ownerName'] == null
                                      ? ''
                                      : userMap['ownerName'],
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 30,
                                  ),
                                ),
                                //Details
                                Text(
                                  userMap['details'] == null
                                      ? ''
                                      : userMap['details'],
                                  style: TextStyle(
                                    color: Color(0xAF47292A),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Cancel
                          SizedBox(
                            width: double.infinity,
                            height: 53,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xAFFFDFD8),
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xAF47292A),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

/*

MaterialPageRoute(
                                      builder: (context) => CartDetailsScreen(
                                        productImg:
                                            userMap['productImg'] == null
                                                ? ''
                                                : userMap['productImg'],
                                        productName:
                                            userMap['productName'] == null
                                                ? ''
                                                : userMap['productName'],
                                        productPrice:
                                            userMap['productPrice'] == null
                                                ? ''
                                                : userMap['productPrice'],
                                        ownerImg: userMap['ownerImg'] == null
                                            ? ''
                                            : userMap['ownerImg'],
                                        ownerName: userMap['ownerName'] == null
                                            ? ''
                                            : userMap['ownerName'],
                                        details: userMap['details'] == null
                                            ? ''
                                            : userMap['details'],
                                      ),
                                    ),

 */
