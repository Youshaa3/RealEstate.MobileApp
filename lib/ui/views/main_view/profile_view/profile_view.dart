import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:real_estate/ui/shared/custom_widgets/setting_widget.dart';
import 'package:real_estate/ui/shared/utils.dart';
import 'package:real_estate/ui/views/about_us_view/about_us_view.dart';
import 'package:real_estate/ui/views/add_house_view/add_house_view.dart';
import 'package:real_estate/ui/views/login_view/login_view.dart';
import 'package:real_estate/ui/views/profile_setting/profile_setting_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate/ui/views/signup_view/signup_view.dart';


class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(

          appBar: AppBar(
            title: Text('Profile'),
            backgroundColor: Colors.teal,
          ),

          drawer: NavigationDrawer(),

          body: SingleChildScrollView(

           child: Column(
            children: [
              Padding(

                padding: EdgeInsets.only(left: size.width*0.04 ,top: size.width*0.05),
                child: Row(
                  children: [
                    Text('Profile' , style: TextStyle(fontSize: size.width*0.05 , fontWeight: FontWeight.bold),),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.04 , right: size.width*0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('MOUSA ALASHKAR' , style: TextStyle(fontSize: size.width*0.05)),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('images/my_pic.jpg' , height: size.height*0.09 , width: size.width*0.18),
                    )
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.045 , bottom: size.width*0.05),
                child: Row(
                  children: [
                    Container(
                      width: size.width*0.12,
                      height: size.height*0.032,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text('BASIC' ,
                          style: TextStyle(fontWeight: FontWeight.bold , fontSize: size.width*0.03 , color: Colors.teal),),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  SettingWidget(name: 'Profile\nSetting' , icon: Icons.settings , onPressed: (){Get.to(ProfileSettingView());}),
                  SettingWidget(name: 'My Saved\nSearches' , icon: Icons.search , onPressed: (){}),
                  SettingWidget(name: 'My\nFavorites' , icon: Icons.favorite_border , onPressed: (){}),

                ],
              ),

              SizedBox(height: size.width*0.02),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  SettingWidget(name: 'My\nProperties' , icon: Icons.home_outlined , onPressed: (){Get.to(SignupView());}),
                  SettingWidget(name: 'Drafts' , icon: Icons.drafts_outlined , onPressed: (){}),
                  SettingWidget(name: 'Quota and\nCredits' , icon: Icons.credit_card , onPressed: (){}),

                ],
              ),

              SizedBox(height: size.width*0.03),
              
              InkWell(
                onTap: (){
                  Get.to(AddHouseView());
                  },
                child: Container(
                  width: size.width*0.92,
                  height: size.height*0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: size.width*0.02 , horizontal: size.width*0.02),
                            child: SvgPicture.asset('images/1.svg' , height: size.height*0.12,),
                          ),
                          SizedBox(width: size.width*0.025),
                          Text("Looking to sell or rent out\nyour property" , style: TextStyle(fontSize: size.width*0.04),)
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: size.width*0.09 , bottom: size.width*0.00),
                            child: Container(
                              width: size.width*0.75,
                              height: size.height*0.04,
                              decoration: BoxDecoration(
                                color: Colors.teal.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(child: Text('Post An Add' ,
                                style: TextStyle(fontSize: size.width*0.035 , fontWeight: FontWeight.bold , color: Colors.white))
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: size.width*0.04),

              InkWell(
                onTap: (){
                  Get.defaultDialog(
                    title: 'Languages',
                    titleStyle: TextStyle(color: Colors.black),
                    content: Container(
                      child: Column(
                        children: [
                          SizedBox(height: size.width*0.06),
                          Text('English' , style: TextStyle(color: Colors.teal)),
                          SizedBox(height: size.width*0.03),
                          Text('العربية' , style: TextStyle(color: Colors.teal)),
                        ],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: size.width*0.06 , right: size.width*0.05),
                  child: Row(
                    children: [
                      Icon(Icons.language),
                      Column(
                        children: [
                          Text('   Language' , style: TextStyle(fontSize: size.width*0.03),),
                          Text('   English' , style: TextStyle(fontSize: size.width*0.038 , color: Colors.teal)),
                        ],
                      ),
                      Spacer(),

                      Icon(Icons.arrow_forward_ios , size:size.width*0.04),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.06 , right: size.width*0.05),
                child: Divider(thickness: size.width*0.0015 , color: Colors.grey),
              ),

              SizedBox(height: size.width*0.04),

              InkWell(
                onTap: (){
                  Get.to(AboutUsView());
                },
                child: Padding(
                  padding: EdgeInsets.only(left: size.width*0.06 , right: size.width*0.05),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline),
                      Column(
                        children: [
                          Text('   About Us' , style: TextStyle(fontSize: size.width*0.038),),

                        ],
                      ),
                      Spacer(),

                      Icon(Icons.arrow_forward_ios , size:size.width*0.04),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.06 , right: size.width*0.05),
                child: Divider(thickness: size.width*0.0015 , color: Colors.grey),
              ),

              SizedBox(height: size.width*0.04),

              InkWell(
                onTap: (){
                  Get.defaultDialog(
                    title: 'How is your experience with our app ?',
                    content: Column(
                      children: [
                        SizedBox(
                          height: size.width*0.4,
                          width: size.width,
                            child: Lottie.network('https://assets3.lottiefiles.com/packages/lf20_3wrglafk/rate us.json')
                        ),
                        SizedBox(height: size.width*0.1),
                        RatingBar.builder(
                          updateOnDrag: true,
                          itemSize: size.width*0.06,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.teal,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: size.width*0.06 , right: size.width*0.05),
                  child: Row(
                    children: [
                      Icon(Icons.thumb_up_alt_outlined),
                      Column(
                        children: [
                          Text('   Feedback' , style: TextStyle(fontSize: size.width*0.038),),

                        ],
                      ),

                      Spacer(),

                      Icon(Icons.arrow_forward_ios , size:size.width*0.04),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.06 , right: size.width*0.05),
                child: Divider(thickness: size.width*0.0015 , color: Colors.grey),
              ),

              SizedBox(height: size.width*0.04),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.06 , right: size.width*0.05),
                child: Row(
                  children: [
                    Icon(Icons.email_outlined),
                    Column(
                      children: [
                        Text('   invite Friends' , style: TextStyle(fontSize: size.width*0.038),),

                      ],
                    ),
                    Spacer(),

                    Icon(Icons.arrow_forward_ios , size:size.width*0.04),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.06 , right: size.width*0.05),
                child: Divider(thickness: size.width*0.0015 , color: Colors.grey),
              ),

              SizedBox(height: size.width*0.04),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.06 , right: size.width*0.05),
                child: Row(
                  children: [
                    Icon(Icons.view_timeline_outlined),
                    Column(
                      children: [
                        Text('   Terms and Privacy Policy' , style: TextStyle(fontSize: size.width*0.038),),

                      ],
                    ),

                    Spacer(),

                    Icon(Icons.arrow_forward_ios , size:size.width*0.04),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.06 , right: size.width*0.05),
                child: Divider(thickness: size.width*0.0015 , color: Colors.grey),
              ),

              SizedBox(height: size.width*0.04),
              
              Padding(
                padding: EdgeInsets.only(left: size.width*0.06 ),
                child: Row(
                  children: [
                    Icon(Icons.logout , color: Colors.red,),

                    InkWell(
                      onTap: ()
                      {
                        storage.setFirstLunch(true);
                        Get.off(LoginView());
                      },
                        child: Text('    Log Out' , style: TextStyle(fontSize: size.width*0.035 , color: Colors.red),)
                    )
                  ],
                ),
              ),

              SizedBox(height: size.width*0.15),



              SizedBox(height: size.width*0.05),

            ],
          ),
        ),
    )
    );
  }
}

class NavigationDrawer extends StatelessWidget{
  NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    ),
  );

  Widget buildHeader(BuildContext context) => Container(
    color: Colors.teal,
    padding: EdgeInsets.only(top: 10),
    child: Column(
      children: [
        SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset('images/my_pic.jpg' , width: 150,height: 150,),
        ),
        SizedBox(height: 5),
        Text('MOUSA ALASHKAR' , style: TextStyle(fontSize: 18),),
        Text('mousa.tma.it@gmail.com' , style: TextStyle(fontSize: 12)),
        SizedBox(height: 5),
      ],
    ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
    padding: EdgeInsets.all(5),
    child: Wrap(
      runSpacing: 15,
      children: [
        ListTile(
          leading: Icon(Icons.home_outlined , color: Colors.teal),
          title: Text('home'),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.settings , color: Colors.teal),
          title: Text('settings'),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.favorite_border_outlined , color: Colors.teal),
          title: Text('favorites'),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.person , color: Colors.teal),
          title: Text('profile'),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.add , color: Colors.teal),
          title: Text('add house'),
          onTap: (){},
        ),
      ],
    ),
  );

}
