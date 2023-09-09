import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:real_estate/ui/shared/utils.dart';
import 'profile_setting_controller.dart';

class ProfileSettingView extends StatefulWidget {
  ProfileSettingView({Key? key}) : super(key: key);

  @override
  State<ProfileSettingView> createState() => _ProfileSettingViewState();
}

class _ProfileSettingViewState extends State<ProfileSettingView> {

  ProfileSettingController controller = Get.put(ProfileSettingController());

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity, 
                    height: screenHeight(3), 
                    decoration: BoxDecoration(color: Colors.teal),
                  ), 
                  Container(
                    width: double.infinity, 
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ],
              ), 
              Padding(
                padding: EdgeInsetsDirectional.only(top: screenWidth(2),start: screenWidth(3)),
                child: Obx(
                      () {
                        print(controller.profileList.value);
                        return controller.profileList == 0 
                            ? SpinKitCircle(color: Colors.teal,) 
                            : Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: screenWidth(25)),
                              child: Container(
                                width: screenWidth(3),
                                height: screenWidth(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.circular(100),
                                  border: Border.all(color: Colors.black , width: screenWidth(150))
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100), 
                                  child: CachedNetworkImage(
                                    imageUrl: '${controller.profileList.value.profileImage}',
                                    placeholder: (context, url) => 
                                        CircularProgressIndicator(), 
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ), 
                            Text(
                              controller.profileList.value.username ?? '', 
                              style: TextStyle(fontSize: screenWidth(12)),
                            ),
                          ],
                        );
                        },
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(bottom: screenWidth(6)),
                  child: Container(
                    width: screenWidth(1.15),
                    height: screenHeight(2.8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(10),
                      boxShadow: [
                        BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                          offset: Offset(0,2),
                          blurRadius: 5
                      )]
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: screenWidth(10),top: screenWidth(10)),
                      child: Obx((){
                        return Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.email , color: Colors.teal,),
                                SizedBox(width: screenWidth(10)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('E-Mail'),
                                    Text(controller.profileList.value.email ?? ''),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: screenWidth(10)),
                            Row(
                              children: [
                                Icon(Icons.phone , color: Colors.teal,),
                                SizedBox(width: screenWidth(10)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Phone Number'),
                                    Text(controller.profileList.value.phoneNumber.toString()),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: screenWidth(10)),
                            Row(
                              children: [
                                Icon(Icons.my_location , color: Colors.teal,),
                                SizedBox(width: screenWidth(10)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Location'),
                                    Text('Syria-homs'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );}
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
