import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 273,
          height: 276,
          child: Column(
            children: [
              Image.asset('images/success.png'),
              SizedBox(
                height: 20,
              ),

              //Payment Successful!
              Text(
                'Payment Successful!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xAF47292A),
                ),
              ),

              SizedBox(
                height: 14,
              ),

              //We have ...
              Padding(
                padding: EdgeInsets.only(
                  bottom: 20,
                ),
                child: Text(
                  'We have emailed you the receipt.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xAF27292A),
                  ),
                ),
              ),

              //Finish!
              SizedBox(
                width: double.infinity,
                height: 47,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'Rate');
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
