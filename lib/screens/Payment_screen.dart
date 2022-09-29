import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 5),
                  child: Text(
                    'Payment',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 5,
                  ),
                  child: Text(
                    'Enter your card Info',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),

                //Card
                Container(
                  width: 336,
                  height: 214,
                  decoration: BoxDecoration(
                    color: Color(0xAFFFDFD8),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 20,
                        offset: Offset(7, 7),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      //Icon
                      ListTile(
                        leading: Icon(
                          Icons.credit_card_outlined,
                          color: Color(0xAF47292A),
                          size: 38.07,
                        ),
                      ),

                      //Card Number
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          left: 27,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                child: TextField(
                                  // controller: _productName,
                                  keyboardType: TextInputType.number,
                                  cursorColor: Colors.black,
                                  cursorRadius: Radius.circular(10),
                                  style: TextStyle(
                                    color: Color(0xAF57292A),
                                    fontSize: 18,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: '1234 5678 9876 5432',
                                    hintStyle: TextStyle(
                                      color: Color(0xAF27292A),
                                      fontSize: 18,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 25,
                                child: TextField(
                                  // controller: _productName,
                                  keyboardType: TextInputType.number,
                                  cursorColor: Colors.black,
                                  cursorRadius: Radius.circular(10),
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 14,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: '1234',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //Owner
                      ListTile(
                        leading: Container(
                          height: 50,
                          width: 100,
                          child: TextField(
                            // controller: _productName,
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.black,
                            cursorRadius: Radius.circular(10),
                            style: TextStyle(
                              color: Color(0xAF47292A),
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Name',
                              hintStyle: TextStyle(
                                color: Color(0xAF27292A),
                                fontSize: 14,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          ),
                        ),
                        trailing: Container(
                          height: 70,
                          width: 100,
                          child: TextField(
                            // controller: _productName,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            cursorRadius: Radius.circular(10),
                            style: TextStyle(
                              color: Color(0xAF47292A),
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              hintText: 'EXPIRY',
                              hintStyle: TextStyle(
                                color: Color(0xAF27292A),
                                fontSize: 15,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 52,
                ),

                //Number
                Padding(
                  padding: EdgeInsets.only(
                    left: 39,
                    right: 39,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      // controller: _productName,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      cursorRadius: Radius.circular(10),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: '6524 2541 2164',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                ),

                //Date
                Padding(
                  padding: EdgeInsets.only(
                    left: 39,
                    right: 39,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      // controller: _productName,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      cursorRadius: Radius.circular(10),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: 'MM/YY',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                ),

                //CCV
                Padding(
                  padding: EdgeInsets.only(
                    left: 39,
                    right: 39,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      // controller: _productName,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      cursorRadius: Radius.circular(10),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: 'CCV',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                ),

                //SizedBox(40)
                SizedBox(
                  height: 40,
                ),

                //Proceed
                Padding(
                  padding: EdgeInsets.only(
                    left: 27,
                    right: 26,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, 'PaymentSuccess');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xAFFFDFD8),
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Proceed',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xAF47292A),
                        ),
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
