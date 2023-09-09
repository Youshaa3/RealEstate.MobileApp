import 'package:real_estate/ui/shared/custom_widgets/main_page_items.dart';
import 'package:real_estate/ui/shared/custom_widgets/ShimmerWidget.dart';
import 'package:real_estate/ui/views/details_view/details_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:real_estate/ui/views/main_view/home_view/home_controller.dart';


class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  HomeViewController controller = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.teal.withOpacity(0.75),
          appBar: AppBar(
            leading: Icon(Icons.menu),
            elevation: 0,
            title: Text('Home'),
            backgroundColor: Colors.teal.withOpacity(0.0),
          ),

          resizeToAvoidBottomInset: false,


          body: Column(
            children: [

              Container(
                margin: EdgeInsets.all(size.width*0.02),
                padding: EdgeInsets.symmetric(horizontal: size.width*0.05 , vertical: size.width*0.01),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [

                    Padding(
                      padding: EdgeInsets.only(bottom: size.width*0.01),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: size.width*0.02),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.15),
                          focusedBorder: InputBorder.none,
                          prefixIcon: Icon(Icons.search , color: Colors.white,),
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    Container(
                        height: size.width*0.35,
                        child: Lottie.asset('images/lo2.json')
                    ),

                  ],
                ),
              ),


              Expanded(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size.width*0.15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(40) , topRight: Radius.circular(40)),
                      ),
                    ),
                    Obx(() {
                      return controller.propertyList.length == 0
                          ? SpinKitCircle(color: Colors.teal,)
                          : Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    itemCount: controller.propertyList.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: ()
                                        {
                                          Get.to(DetailsView(model: controller.propertyList[index]));
                                        },
                                        child: MainHouseCard(
                                          houseTitle: controller.propertyList[index].name ?? '',
                                          houseDescription: controller.propertyList[index].description ?? '',
                                          imageName: '${controller.propertyList[index].image![0].image}',
                                          price: controller.propertyList[index].price.toString(),
                                        ),
                                      );
                                    }),
                              ),
                              Text('',style: TextStyle(fontSize: size.width*0.12 , color: Colors.transparent)),
                            ],
                          );
                    }
                    ),
                  ],
                ),
              ),
        ],
      )
      ),
    );
  }

  Widget buildShimmer2() => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ShimmerWidget.circular(
          height: MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 5),
              child: ShimmerWidget.rectangular(
                height: 10,
                width: MediaQuery.of(context).size.width * 0.7,
              ),
            )),
      ]),
    ),
  );

}
