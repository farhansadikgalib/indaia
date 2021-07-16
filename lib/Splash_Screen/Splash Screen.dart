import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:indaia/Check_Connection/No%20Internet.dart';
import 'package:indaia/Check_Connection/check_internet.dart';
import 'package:indaia/Home_Page/HomePage.dart';


class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>with TickerProviderStateMixin  {


  int checkInt = 0;

  @override
  void initState() {
    super.initState();
    Future<int> a = CheckInternet().checkInternetConnection();
    a.then((value) {
      if (value == 0) {
        setState(() {
          checkInt = 0;
        });
        print('No internet connect');
        Timer(
            Duration(seconds: 4),
                () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => No_Internet_Connection()),
                    (route) => false));


      } else {
        setState(() {
          checkInt = 1;
        });
        print('Internet connected');
        Timer(
            Duration(seconds: 4),
                () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage(url: 'https://areadocliente.eventosindaia.com.br/')),
                    (route) => false));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Connected to the internet'),
        ));
      }
    });



  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(109, 108, 98, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
                height: 200,
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    "assets/logoo.png",
                  ),
                )),
          ),
          SizedBox(
            height: 75,
          ),

          SpinKitFadingCube(
            color: Colors.white,
            size: 25.0,
            controller: AnimationController( duration: const Duration(milliseconds:1300),vsync: this),
          ),


          // Text("loading",
          //     style: TextStyle(fontSize: 14, fontFamily: "Poppins",color: Colors.yellow[800])),
          SizedBox(
            height: 10,
          ),
          // _AnimatedLiquidLinearProgressIndicator(),
        ],
      ),
    );
  }
}
//
// class _AnimatedLiquidLinearProgressIndicator extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() =>
//       _AnimatedLiquidLinearProgressIndicatorState();
// }
//
// class _AnimatedLiquidLinearProgressIndicatorState
//     extends State<_AnimatedLiquidLinearProgressIndicator>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 4),
//     );
//
//     _animationController.addListener(() => setState(() {}));
//     _animationController.repeat();
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final percentage = _animationController.value * 100;
//     return Center(
//       child: Container(
//         width: 200,
//         height: 15.0,
//         padding: EdgeInsets.symmetric(horizontal: 24.0),
//         child: LiquidLinearProgressIndicator(
//           value: _animationController.value,
//           backgroundColor: Colors.brown,
//           valueColor: AlwaysStoppedAnimation(Colors.white),
//           borderRadius: 5.0,
//           borderColor: Colors.white,
//           borderWidth: 2.0,
//           // center: Text(
//           //   "${percentage.toStringAsFixed(0)}%",
//           //   style: TextStyle(
//           //     color: Colors.lightBlueAccent,
//           //     fontSize: 20.0,
//           //     fontWeight: FontWeight.bold,
//           //   ),
//           // ),
//         ),
//       ),
//     );
//   }
// }
