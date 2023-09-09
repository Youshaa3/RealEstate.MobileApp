import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HouseCard extends StatefulWidget {
  const HouseCard({Key? key, required this.name, required this.price, required this.location, required this.imageName}) : super(key: key);

  final String name;
  final String imageName;
  final String price;
  final String location;

  @override
  State<HouseCard> createState() => _HouseCardState();
}

class _HouseCardState extends State<HouseCard> {
  Color iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return InkWell(
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: size.width,
                  height: size.width*0.6,
                  child: CachedNetworkImage(
                    imageUrl: widget.imageName,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.width*0.03 , right: size.width*0.04),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: InkWell(
                          onTap: (){
                            setState(() {
                              iconColor = iconColor == Colors.white ? Colors.red : Colors.white;
                            });
                          },
                          child: Icon(Icons.favorite , color: iconColor , size: size.width*0.08)
                      ),
                    )
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: size.width*0.02 , left: size.width*0.02 , right: size.width*0.02),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(widget.name , style: TextStyle(fontSize: size.width*0.05),),
                    Spacer(),
                    Text('\$'+widget.price , style: TextStyle(fontSize: size.width*0.045 , color: Colors.teal),),
                    Text(' per month' , style: TextStyle(fontSize: size.width*0.04 , color: Colors.grey),),
                  ],
                ),
                Row(
                  children: [
                    // Icon(Icons.location_on),
                    Text(widget.location , style: TextStyle(fontSize: size.width*0.04 , color: Colors.grey),)
                  ],
                ),
                SizedBox(height: size.height*0.01),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
