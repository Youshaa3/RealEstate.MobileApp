import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:real_estate/ui/shared/custom_widgets/house_card.dart';
import 'package:real_estate/ui/views/main_view/favorite_view/favorites_controller.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  FavoritesController controller = Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Colors.teal,
      ),
      body: Obx(() {
        return controller.favoritesList.length == 0
            ? SpinKitCircle(
                color: Colors.teal,
              )
            : ListView.builder(
                itemCount: controller.favoritesList.length,
                itemBuilder: (BuildContext context, index) {
                  return HouseCard(
                    name: '${controller.favoritesList[index].user.toString() ?? ''}',
                    price:
                        '${controller.favoritesList[index].item!.price.toString()}',
                    location:
                        '${controller.favoritesList[index].item!.city ?? ''}',
                    imageName:
                        '${controller.favoritesList[index].item!.image![0].image ?? ''}',
                  );
                });
      }),
    ));
  }
}
