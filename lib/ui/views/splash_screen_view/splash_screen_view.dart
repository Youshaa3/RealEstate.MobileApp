import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:real_estate/ui/views/splash_screen_view/splash_screen_controller.dart';



class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {

  SplashScreenController splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [

            Center(
              child: Image.asset('images/splash.jpg' , height: size.height , width: size.width , fit: BoxFit.fill),
            ),

            Padding(
              padding: EdgeInsets.only(top: size.height * 0.75),
              child: SpinKitThreeBounce(
                color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}
