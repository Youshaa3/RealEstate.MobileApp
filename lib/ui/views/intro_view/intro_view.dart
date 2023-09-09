import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/ui/views/login_view/login_view.dart';

class IntroView extends StatefulWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Center(child: InkWell(onTap: (){Get.to(LoginView());},child: Text('intro')),),));
  }
}