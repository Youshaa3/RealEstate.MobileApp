import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/ui/views/signup_view/signup_controller.dart';
import '../../shared/custom_widgets/custom_text_field.dart';
import '../../shared/utils.dart';
import '../login_view/login_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {

  SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: size.width*0.7,
                  width: size.width,
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
                        child: Text('Register' , style: TextStyle(color: Colors.white , fontSize: size.width*0.06),)),
                  ),
                ),

                SizedBox(height: size.height*0.05),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [

                      CustomTextField(
                        controller: controller.nameController,
                        hitText: 'Full Name',
                        icon: Icons.person,
                        validator: (value)
                        {
                          return value!.isEmpty ? 'please Enter your Name' : null ;
                        },
                      ),

                      CustomTextField(
                        controller: controller.emailController,
                        hitText: 'Email Address',
                        icon: Icons.email,
                        validator: (value)
                        {
                          return value!.isEmpty || !isEmail(value) ? 'please check your Email' : null ;
                        },
                      ),

                      CustomTextField(
                        controller: controller.phoneController,
                        hitText: 'Phone Number',
                        icon: Icons.phone,
                        validator: (value)
                        {
                          return value!.isEmpty ? 'please Enter your Phone Number' : null ;
                        },
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width*0.05 , vertical: size.width*0.02),
                        child: TextFormField(
                          controller: controller.passwordController1,
                          style: TextStyle(color: Colors.black),
                          obscureText: controller.hidePassword1.value,
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              onPressed: ()
                              {
                                setState(() {controller.hidePassword1.value =! controller.hidePassword1.value;});
                                },
                              icon: Icon(controller.hidePassword1.value ? Icons.visibility_off : Icons.visibility , color: Colors.teal,),
                            ),
                            errorStyle: TextStyle(color: Colors.red),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.15),
                            hintText: 'password',
                            contentPadding: EdgeInsets.symmetric(vertical: size.width*0.03 ,horizontal: size.width*0.05),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide(color: Colors.grey)
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
                          validator: (value)
                          {
                            return value!.isEmpty || !isPassword(value) ? 'please check password' : null ;
                          },
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width*0.05 , vertical: size.width*0.02),
                        child: TextFormField(
                          controller: controller.passwordController2,
                          style: TextStyle(color: Colors.black),
                          obscureText: controller.hidePassword2.value,
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              onPressed: ()
                              {
                                setState(() {controller.hidePassword2.value =! controller.hidePassword2.value;});
                                },
                              icon: Icon(controller.hidePassword2.value ? Icons.visibility_off : Icons.visibility , color: Colors.teal,),
                            ),
                            errorStyle: TextStyle(color: Colors.red),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.15),
                            hintText: 'password',
                            contentPadding: EdgeInsets.symmetric(vertical: size.width*0.03 ,horizontal: size.width*0.05),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide(color: Colors.grey)
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
                          validator: (value)
                          {
                            return value!.isEmpty || !isPassword(value) ? 'please check password' : null ;
                          },
                        ),
                      ),
                    ],
                  ),
                ),



                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width*0.1 , vertical: size.width*0.06),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.signup();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shadowColor: Colors.black,
                      fixedSize: Size( size.width*0.5 , size.width*0.12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(24.0),
                        ),
                      ),
                    ),
                    child: Text("Sign up" , style: TextStyle(  fontSize: size.width*0.05),),
                  ),
                ),


                Container(
                  padding: EdgeInsets.only(bottom: size.width*0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have Already Member?  "),
                      InkWell(
                        onTap: (){ Get.to( LoginView() ); },
                        child: Text("Login Now", style: TextStyle(color: Colors.teal,),
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

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
}
