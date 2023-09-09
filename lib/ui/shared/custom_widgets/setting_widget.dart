import 'package:flutter/material.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({Key? key, required this.icon, required this.name, required this.onPressed}) : super(key: key);

  final IconData icon;
  final String name;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return InkWell(

      onTap: (){onPressed();},

      child: Container(
        child: Padding(
          padding: EdgeInsets.only(top: size.width*0.06),
          child: Column(
            children: [
              Icon(icon , color: Colors.teal),
              SizedBox(height: size.width*0.03),
              Text(name , style: TextStyle(fontWeight: FontWeight.bold ) , textAlign:TextAlign.center)
            ],
          ),
        ),
        width: size.width*0.28,
        height: size.height*0.13,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
