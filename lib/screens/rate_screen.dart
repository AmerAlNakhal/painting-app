import 'package:flutter/material.dart';

class RateScreen extends StatefulWidget {
  @override
  _RateScreenState createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  Color star1 = Colors.grey;
  Color star2 = Colors.grey;
  Color star3 = Colors.grey;
  Color star4 = Colors.grey;
  Color star5 = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Payment Successful!
              Text(
                'How was your order experiences from it Painting?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xAF47292A),
                ),
              ),
              //SizedBox(20)
              SizedBox(
                height: 20,
              ),
              //Stars
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //star1
                  IconButton(
                    icon: Icon(
                      Icons.star_rounded,
                      color: star1,
                    ),
                    onPressed: () {
                      setState(() {
                        star1 = Color(0xAF99192A);
                        star2 = Colors.grey;
                        star3 = Colors.grey;
                        star4 = Colors.grey;
                        star5 = Colors.grey;
                      });
                    },
                  ),

                  //star2
                  IconButton(
                    icon: Icon(
                      Icons.star_rounded,
                      color: star2,
                    ),
                    onPressed: () {
                      setState(() {
                        star1 = Color(0xAF99192A);
                        star2 = Color(0xAF99192A);
                        star3 = Colors.grey;
                        star4 = Colors.grey;
                        star5 = Colors.grey;
                      });
                    },
                  ),

                  //star3
                  IconButton(
                    icon: Icon(
                      Icons.star_rounded,
                      color: star3,
                    ),
                    onPressed: () {
                      setState(() {
                        star1 = Color(0xAF99192A);
                        star2 = Color(0xAF99192A);
                        star3 = Color(0xAF99192A);
                        star4 = Colors.grey;
                        star5 = Colors.grey;
                      });
                    },
                  ),

                  //star4
                  IconButton(
                    icon: Icon(
                      Icons.star_rounded,
                      color: star4,
                    ),
                    onPressed: () {
                      setState(() {
                        star1 = Color(0xAF99192A);
                        star2 = Color(0xAF99192A);
                        star3 = Color(0xAF99192A);
                        star4 = Color(0xAF99192A);
                        star5 = Colors.grey;
                      });
                    },
                  ),

                  //star5
                  IconButton(
                    icon: Icon(
                      Icons.star_rounded,
                      color: star5,
                    ),
                    onPressed: () {
                      setState(() {
                        star1 = Color(0xAF99192A);
                        star2 = Color(0xAF99192A);
                        star3 = Color(0xAF99192A);
                        star4 = Color(0xAF99192A);
                        star5 = Color(0xAF99192A);
                      });
                    },
                  ),
                ],
              ),
              //SizedBox(20)
              SizedBox(
                height: 20,
              ),
              //Finish!
              SizedBox(
                width: double.infinity,
                height: 47,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'Home');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xAFFFDFD8),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Finish!',
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
    );
  }
}
