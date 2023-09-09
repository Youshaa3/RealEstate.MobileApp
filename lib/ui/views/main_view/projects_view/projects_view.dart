import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:real_estate/ui/shared/custom_widgets/ShimmerWidget.dart';
import 'package:real_estate/ui/shared/custom_widgets/house_card.dart';
import 'package:real_estate/ui/views/details_view/details_view.dart';
import 'projects_controller.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({Key? key}) : super(key: key);

  @override
  _ProjectsViewState createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {

  ProjectsController controller = Get.put(ProjectsController());


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.menu),
            title: Text('projects'),
            backgroundColor: Colors.teal,
          ),

          body: Padding(
            padding: EdgeInsets.only(top: size.width*0.02 , left: size.width*0.02 , right: size.width*0.02),
            child: Obx( () {
                      return controller.isProjectsLoading ? SpinKitCircle(color: Colors.teal,) :
                      controller.projectList.isEmpty
                          ? Text('No Data') :
                     ListView.builder(
                       shrinkWrap: true,
                      itemCount: controller.projectList.length,
                        itemBuilder: (context,index) {
                        return InkWell(
                          onTap: (){
                            Get.to(DetailsView(model: controller.projectList[index]));
                          },
                          child: HouseCard(
                              name: controller.projectList[index].name ?? '',
                              imageName: '${controller.projectList[index].image![0].image }' ,
                              price: controller.projectList[index].price.toString(),
                              location: controller.projectList[index].city ?? '',
                          ),
                        );
                        }
                    );
                  },
                ),
            ),
          ),

          // drawer: NavigationDrawer(),
    );
  }

  Widget buildShimmer2() => Padding(
    padding: EdgeInsetsDirectional.all(10.0),
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
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: 10, start: 5),
              child: ShimmerWidget.rectangular(
                height: 10,
                width: MediaQuery.of(context).size.width * 0.7,
              ),
            )),
      ]),
    ),
  );

}





