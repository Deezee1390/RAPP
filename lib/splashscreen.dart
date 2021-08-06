import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xff000725),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyImage(),
                
              ], 
            ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text("Welcome To RAPP", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20, color: Colors.white),),
              ], 
            ),
            ),

        ],)
    ),
      
    );
  }
}

class MyImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AssetImage image=new AssetImage("images/icon.png");
    Image logo= new Image(image: image, width:200, height:200);
    return logo;
  }
}