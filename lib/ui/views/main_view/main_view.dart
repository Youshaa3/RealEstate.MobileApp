import 'package:flutter/material.dart';
import 'package:real_estate/core/enums/bottom_navigation.dart';
import 'package:real_estate/ui/views/main_view/favorite_view/favorites_view.dart';
import 'package:real_estate/ui/views/main_view/home_view/home_view.dart';
import 'package:real_estate/ui/views/main_view/main_view_widget/bottom_navigation_widget.dart';
import 'package:real_estate/ui/views/main_view/profile_view/profile_view.dart';
import 'package:real_estate/ui/views/main_view/projects_view/projects_view.dart';
import 'package:real_estate/ui/views/main_view/search_view/search_view.dart';





class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  TextEditingController searchController = TextEditingController();

  BottomNavigationEnum select = BottomNavigationEnum.HOME;
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        key: key,
        resizeToAvoidBottomInset: false,
        body: Stack(
            children: [
              PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: controller,
                children: [
                  HomeView(),
                  ProjectsView(),
                  SearchView(),
                  FavoritesView(),
                  ProfileView(),
                ],
              ),

              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: BottomNavigationWidget(
                  bottomNavigation: select,
                  onTap: (selected , pageNumber ) {
                    // key.currentState!.openDrawer();
                    setState(() {
                      select = selected;
                    }
                    );
                    controller.jumpToPage(pageNumber);
                  },
                ),
              ),
            ],
          ),
        ),
    );
  }
}