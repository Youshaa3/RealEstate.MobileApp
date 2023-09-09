import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:real_estate/ui/shared/utils.dart';
import 'package:real_estate/ui/views/signup_view/signup_view.dart';
import 'login_controller.dart';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  LoginController controller = LoginController();


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
                    color: Color.fromRGBO(5, 101, 102, 1.0),
                    gradient: LinearGradient(colors: [( Color.fromRGBO(48, 146, 135, 1.0)), Color.fromRGBO(16, 102, 87, 1.0)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: size.width*0.05 , bottom: size.width*0.05),
                    child: Align(alignment: Alignment.bottomRight,
                        child: Text('Login' , style: TextStyle(color: Colors.white , fontSize: size.width*0.06),)),
                  ),
                  ),

                SizedBox(height: size.width*0.05),

                Form(
                  // key: _formKey,
                  child: Column(
                    children: [

                      CustomTextField(
                        controller: controller.nameController,
                        hitText: 'Name',
                        icon: Icons.email,
                        validator: (value)
                        {
                          return value!.isEmpty || !isEmail(value) ? 'please check your Email' : null ;
                        },
                      ),

                      CustomTextField(
                        controller: controller.passwordController,
                        hitText: 'Password',
                        icon: Icons.visibility_off,
                        validator: (value)
                        {
                          return value!.isEmpty || !isPassword(value) ? 'please check password' : null ;
                        },
                      ),
                    ],
                  ),
                ),


                Padding(
                  padding: EdgeInsets.only(top: size.width*0.03 , bottom: size.width*0.02),
                  child: InkWell(
                      onTap: (){},
                      child: Text("   Forget Password?" , style: TextStyle(fontSize: size.width*0.035),)
                  ),
                ),



                  ElevatedButton(
                    onPressed: ()
                    {
                      controller.login();
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      fixedSize: Size(size.width*0.6, size.height * 0.055),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(24.0),
                        ),
                      ),
                    ),
                    child: Text("Log in" , style: TextStyle(  fontSize: size.width*0.05),),
                ),

                SizedBox(height: size.width*0.02),

                Container(
                  height: size.width*0.1,
                  padding: EdgeInsets.only(bottom: size.width*0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have Any Account?  "),
                      InkWell(
                        onTap: (){ Get.to( SignupView() ); },
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],

            ),
          ),
        )
    );
  }
}
