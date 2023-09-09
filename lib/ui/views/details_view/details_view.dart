import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:real_estate/core/data/models/apis/propertie_model.dart';
import 'package:real_estate/ui/views/details_view/details_controller.dart';
import 'package:url_launcher/url_launcher.dart';



class DetailsView extends StatefulWidget {
  const DetailsView({Key? key, required this.model}) : super(key: key);
  final PropertiesModel model;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {

  late DetailController controller;
  @override
  void initState() {
    controller = Get.put(DetailController(widget.model));
    super.initState();
  }

  int activeIndex = 0;

  void launchWhatsApp({required number , required message}) async {
    final Uri url = Uri.parse("whatsapp://send?phone=$number&text=$message");
    await canLaunchUrl(url) ? launchUrl(url) : print('cant');
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SafeArea(

        child: Scaffold(
          resizeToAvoidBottomInset: false,

          body: SingleChildScrollView(
            child: Obx((){
              return Column(
                children: [

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.03 , vertical: size.width*0.03),
                    child: Column(
                      children: [
                        Container(
                          width: size.width,
                          height: size.height*0.35,
                          child: widget.model.price==null ? SpinKitCircle(color: Colors.teal,) :
                          CarouselSlider.builder(
                                itemCount: widget.model.image!.length,
                                options: CarouselOptions(
                                  reverse: false,
                                  height: size.height*0.4,
                                  enlargeCenterPage: true,
                                  viewportFraction: 0.7,
                                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                                  onPageChanged: (index , reason) => setState(() => activeIndex = index),
                                ),
                                itemBuilder: (context , index , realIndex)
                                 {
                                   return CachedNetworkImage(
                                         fit: BoxFit.cover,
                                         imageUrl: '${widget.model.image![index].image}',
                                         placeholder: (context, url) =>
                                             CircularProgressIndicator(),
                                         errorWidget: (context, url, error) =>
                                             SpinKitCircle(color: Colors.teal,),
                                   );
                                 },
                          ),
                        ),

                        SizedBox(height: size.height*0.03),

                        // buildIndicator(),
                      ],
                    ),
                  ),

                   widget.model.price==null ? SpinKitCircle(color: Colors.teal,)  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.03 , vertical: size.width*0.03),
                      child: Container(
                        width: size.width,
                        height: size.height*0.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 2), // changes position of shadow
                              ),
                            ]
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: size.width*0.03 , left: size.width*0.04 , right: size.width*0.04),
                              child: Row(
                                children: [
                                  Icon(Icons.attach_money , color: Colors.teal.withOpacity(0.6)),
                                  SizedBox(width: size.width*0.01),
                                  Text(widget.model.price.toString() ,style: TextStyle(fontSize: size.width*0.05 , fontWeight: FontWeight.bold),),

                                  Spacer(),

                                  Icon(Icons.other_houses_outlined , color: Colors.teal.withOpacity(0.6)),
                                  SizedBox(width: size.width*0.01),
                                  Text('House' ,style: TextStyle(fontSize: size.width*0.04),),

                                  Spacer(),

                                  Icon(Icons.location_on_outlined , color: Colors.teal.withOpacity(0.6)),
                                  SizedBox(width: size.width*0.01),
                                  Text(widget.model.city ?? '' ,style: TextStyle(fontSize: size.width*0.04),),
                                ],
                              ),
                            ),

                            SizedBox(height: size.width*0.12),

                            Padding(
                              padding: EdgeInsets.only(bottom: size.width*0.03 , left: size.width*0.15 , right: size.width*0.15),
                              child: Row(
                                children: [
                                  Icon(Icons.bathroom_outlined , color: Colors.teal.withOpacity(0.6)),
                                  SizedBox(width: size.width*0.01),
                                  Text('3 Bath' ,style: TextStyle(fontSize: size.width*0.04),),

                                  Spacer(),

                                  Icon(Icons.chair_outlined , color: Colors.teal.withOpacity(0.6)),
                                  SizedBox(width: size.width*0.01),
                                  Text('5 Rooms' ,style: TextStyle(fontSize: size.width*0.04),),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),

                   widget.model == 0 ? SpinKitCircle(color: Colors.teal,) : Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.03 , vertical: size.width*0.03),
                      child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 2), // changes position of shadow
                              ),
                            ]
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width*0.02 , vertical: size.width*0.02),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Description' , style: TextStyle(fontSize: size.width*0.05 , fontWeight: FontWeight.bold),),
                              SizedBox(height: size.width*0.02),
                              Padding(
                                padding: EdgeInsets.only(left: size.width*0.03 , right: size.width*0.03 , bottom: size.width*0.03),
                                child: Text(widget.model.description ?? ''),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ),

                  SizedBox(height: size.width*0.08),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.08),
                    child: Row(
                      children: [

                        InkWell(
                          onTap: () async {
                            final Uri url = Uri(
                              scheme: 'tel',
                              path: "+963936286747",
                            );
                            if(await canLaunchUrl(url)){await launchUrl(url);}
                            else print('cant open');
                          },
                          child: Container(
                            width: size.width*0.3,
                            height: size.width*0.12,
                            decoration: BoxDecoration(
                              color: Colors.teal.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width*0.08),
                              child: Row(
                                children: [
                                  Icon(Icons.phone , color: Colors.white , size: size.width*0.048),
                                  SizedBox(width: size.width*0.02),
                                  Text('Call' , style: TextStyle(color: Colors.white , fontSize: size.width*0.04),),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Spacer(),

                        InkWell(
                          onTap: () async {
                            // await launchUrl(whatsapp);
                            launchWhatsApp(number: '+963936286747', message: 'can i have more details about the house please');
                          },
                          child: Container(
                            width: size.width*0.3,
                            height: size.width*0.12,
                            decoration: BoxDecoration(
                                color: Colors.teal.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width*0.03),
                              child: Row(
                                children: [
                                  Icon(Icons.messenger_outline , color: Colors.white , size: size.width*0.048),
                                  SizedBox(width: size.width*0.02),
                                  Text('Message' , style: TextStyle(color: Colors.white , fontSize: size.width*0.04),),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  SizedBox(height: size.width*0.05),

                  Text(controller.count.value.toString(),style: TextStyle(color: Colors.transparent),)

                ],
              );}
            ),
          ),

        ),
    );
  }

  // Widget buildImage (String images , int index) => Container(
  //   color: Colors.grey,
  //   child: ListView.builder(
  //     itemCount: widget.model.image!.length,
  //     itemBuilder: (BuildContext context , index){
  //     return CachedNetworkImage(
  //       imageUrl: '${widget.model.image![index].image}',
  //       placeholder: (context, url) =>
  //           CircularProgressIndicator(),
  //       errorWidget: (context, url, error) =>
  //           SpinKitCircle(color: Colors.teal,),
  //     );}
  //   )
  // );

  // Widget buildIndicator () => AnimatedSmoothIndicator
  //   (
  //   duration: Duration(milliseconds: 600),
  //   activeIndex: activeIndex,
  //   count: imageName.length,
  //   effect: ExpandingDotsEffect(
  //     activeDotColor: Colors.teal,
  //     dotColor: Colors.grey,
  //     dotHeight: 12,
  //     dotWidth: 15,
  //   ),
  //   );



}
