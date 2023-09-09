import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


import '../colors.dart';

class MainHouseCard extends StatelessWidget {
  const MainHouseCard({Key? key, required this.houseTitle, required this.price, required this.imageName, required this.houseDescription}) : super(key: key);

  final String houseTitle;
  final String houseDescription;
  final String price;
  final String imageName;



  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width*0.03 , vertical: size.width*0.03),
      height: size.height*0.2,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: size.height*0.18,
            decoration: BoxDecoration(
              color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
              borderRadius: BorderRadius.circular(22),
              boxShadow: [kDefaultShadow],
            ),
            child: Container(
              margin: EdgeInsets.only(right: size.width*0.02),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22)
              ),
            ),
          ),

          Positioned(
            top: -2,
            right: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.06),
              height: size.width*0.35,
              width: size.width*0.48,
              child: ClipRRect(
                child: CachedNetworkImage(
                  imageUrl: imageName,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: size.height*0.18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.01),
                    child: Padding(
                      padding: EdgeInsets.only(top: size.width*0.03),
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(houseTitle),
                            SizedBox(height: size.width*0.05),
                            Container(width: size.width*0.4,
                                child: Text(houseDescription,maxLines: 2,)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: size.width*0.3,
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.04 , vertical: size.width*0.01),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22) , topRight: Radius.circular(22)),
                    ),
                    child: Text('\$'+price),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
