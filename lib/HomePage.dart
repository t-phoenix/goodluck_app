import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //CODE FOR PAYMENT

  get bottomAppBarContents => null;


  int totalAmount=0;
  Razorpay _razorpay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async{
    var options = {
      'key': 'rzp_test_9M0sQBRmOJZsyz',
      'amount': totalAmount * 100,
      'name': 'GOOD LUCK',
      'description': 'Donations',
      'prefill': {'contact': '', 'email': ''},
      'external': {
        'wallets': ['paytm']
      }
    };
    try{
      _razorpay.open(options);
    }
    catch(e){
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response){
    Fluttertoast.showToast(msg: "SUCCESS: "+ response.paymentId, textColor:Colors.black);
  }

  void _handlePaymentError(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: "ERROR: "+ response.code.toString() + " - " + response.message, textColor: Colors.black);
  }

  void _handleExternalWallet(ExternalWalletResponse response){
    Fluttertoast.showToast(msg: "External Wallet: "+ response.walletName, textColor: Colors.black);
  }

  //CODE FOR PAYMENT ENDS


  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/blue_wall.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,


        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "->Check your Luck by tapping on Thumbs up/down \n ->Come Again tomorrow to check your luck \n ->Please donate if you think this app was usefull",
                      style: TextStyle(
                          color: Colors.teal[50],
                          fontSize: 20,
                          fontFamily: "Chilanka",
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
                width: 40,
              ),
              Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/four-leaf-clover.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                height: 30,
                width: 20,
              ),

              SizedBox(
                width: 100.0,
                height: 30,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Amount',
                    fillColor: Colors.teal[50],
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Caveat',
                    ),

                  ),
                  onChanged: (value){
                    setState(() {
                      totalAmount=num.parse(value);
                    });
                  },
                  style: TextStyle(
                    fontSize: 20,
                    //backgroundColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Caveat',

                  ),
                  textAlign: TextAlign.center,

                ),
              ),
              SizedBox(
              height: 15,
              width: 20,
            ),
              RaisedButton(
                color: Colors.orange,
                child: Text('Donate Money',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Caveat',

                  ),
                ),
                onPressed: () {
                  openCheckout();
                },
              ),
            ],

          ),

        ),

      )




    );



  }
}



