import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(

          appBar: AppBar(
            leading: Icon(Icons.arrow_back_ios , color: Colors.black,),
            title: Text('About US' , style: TextStyle(color: Colors.black),),
            backgroundColor: Colors.white,
            elevation: 2,
          ),

          body: Center(
            child: Padding(
              padding: EdgeInsets.only(top: size.width*0.1 , bottom: size.width*0.05),
              child: Column(
                children: [
                  Container(
                    width: size.width*0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                        color: Colors.grey,
                          offset: Offset(0,2),
                          blurRadius: 2
                      )],
                    ),
                    child: Column(
                      children: [

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width*0.05 , vertical: size.width*0.02),
                              child: CircleAvatar(child: SvgPicture.asset('images/app_icon.svg')),
                            ),
                            Text('Real Estate' , style: TextStyle(fontSize: size.width*0.05 , fontWeight: FontWeight.bold),)
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width*0.08 , vertical: size.width*0.02),
                          child: Row(
                            children: [
                              Icon(Icons.info_outline , color: Colors.black,),
                              SizedBox(width: size.width*0.050,),
                              Text('Version \n 1.0'),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
                          child: Divider(color: Colors.grey,thickness: size.width*0.002),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width*0.08 , vertical: size.width*0.02),
                          child: Row(
                            children: [
                              Icon(Icons.sync , color: Colors.black,),
                              SizedBox(width: size.width*0.050,),
                              Text('Changelog' , style: TextStyle(fontSize: size.width*0.04),),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
                          child: Divider(color: Colors.grey,thickness: size.width*0.002),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width*0.08 , vertical: size.width*0.02),
                          child: Row(
                            children: [
                              Icon(Icons.check_circle_rounded , color: Colors.black,),
                              SizedBox(width: size.width*0.050,),
                              Text('Licence' , style: TextStyle(fontSize: size.width*0.04),),
                            ],
                          ),
                        ),

                        SizedBox(height: size.width*0.04),

                      ],
                    ),
                  ),

                  SizedBox(height: size.width*0.08),

                  Container(
                    width: size.width*0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0,2),
                            blurRadius: 2
                        )],
                    ),
                    child: Column(
                      children: [

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width*0.05 , vertical: size.width*0.02),
                              child: Text('Author' , style: TextStyle(fontSize: size.width*0.05 , fontWeight: FontWeight.bold),)

                            ),
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width*0.08 , vertical: size.width*0.02),
                          child: Row(
                            children: [
                              Icon(Icons.person , color: Colors.black,),
                              SizedBox(width: size.width*0.050,),
                              Text('MSA \n Syria'),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
                          child: Divider(color: Colors.grey,thickness: size.width*0.002),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width*0.08 , vertical: size.width*0.02),
                          child: Row(
                            children: [
                              Icon(Icons.download , color: Colors.black,),
                              SizedBox(width: size.width*0.050,),
                              Text('Download From Cloud' , style: TextStyle(fontSize: size.width*0.04),),
                            ],
                          ),
                        ),

                        SizedBox(height: size.width*0.03),

                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.width*0.05),
                    child: Container(
                      width: size.width*0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0,2),
                              blurRadius: 2
                          )],
                      ),
                      child: Column(
                        children: [

                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width*0.05 , vertical: size.width*0.02),
                                  child: Text('Company' , style: TextStyle(fontSize: size.width*0.05 , fontWeight: FontWeight.bold),)

                              ),
                            ],
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width*0.08 , vertical: size.width*0.02),
                            child: Row(
                              children: [
                                Icon(Icons.home_work_outlined , color: Colors.black,),
                                SizedBox(width: size.width*0.050,),
                                Text('IT-SMART \n mobile application'),
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
                            child: Divider(color: Colors.grey,thickness: size.width*0.002),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width*0.08 , vertical: size.width*0.02),
                            child: Row(
                              children: [
                                Icon(Icons.location_on , color: Colors.black,),
                                SizedBox(width: size.width*0.050,),
                                Text('Syria,Homs' , style: TextStyle(fontSize: size.width*0.04),),
                              ],
                            ),
                          ),

                          SizedBox(height: size.width*0.03),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
    )
    );
  }
}
