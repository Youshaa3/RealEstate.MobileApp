import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {

  TextEditingController emailController = TextEditingController(text: 'mousa@gmail.com');
  TextEditingController passwordController = TextEditingController(text: 'Mousa@2000');
  TextEditingController phoneController = TextEditingController(text: '+963-936286747');


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(

          appBar: AppBar(
            leading: Icon(Icons.arrow_back_ios , color: Colors.black,),
            title: Text('Profile Settings' , style: TextStyle(color: Colors.black),),
            backgroundColor: Colors.white,
            elevation: 2,
          ),

          body: Center(
              child: Column(
                children: [

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.04 , vertical: size.width*0.02),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: size.width*0.02 , horizontal: size.width*0.02),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.04 , vertical: size.width*0.02),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: size.width*0.02 , horizontal: size.width*0.02),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
                    child: Divider(color: Colors.grey , thickness: size.width*0.003,),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.04 , vertical: size.width*0.02),
                    child: TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        prefixIcon: Row(
                          children: [
                            SizedBox(width: size.width*0.02),
                            Icon(Icons.phone),
                            SizedBox(width: size.width*0.02),
                            Container(width: 2,height: 40,color: Colors.grey,),
                          ],
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: size.width*0.02 , vertical: size.width*0.02),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )
                      ),
                    ),
                  ),


                ],
              ),
          ),

        ),
    );
  }
}
