import 'package:flutter/material.dart';

import '../colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({Key? key, required this.hitText, this.borderColor, this.textColor, this.labelText, this.keyboardType, required this.controller, this.validator, required this.icon}) : super(key: key);

  final String hitText;
  final Color? borderColor;
  final Color? textColor;
  final String? labelText;
  final IconData icon;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width*0.05 , vertical: size.width*0.02),
      child: TextFormField(
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon , color: Colors.teal,),
          errorStyle: TextStyle(color: Colors.red),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.15),
          hintText: widget.hitText,
          contentPadding: EdgeInsets.symmetric(vertical: size.width*0.03 ,horizontal: size.width*0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(color: widget.borderColor ?? AppColors.transparentColor)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(color: Colors.transparent),
          ),

        ),
        style: TextStyle(color:Colors.black),
      ),
    );
  }
}
