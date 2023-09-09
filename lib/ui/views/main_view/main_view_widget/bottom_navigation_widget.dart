import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate/core/enums/bottom_navigation.dart';
import '../../../shared/colors.dart';

class BottomNavigationWidget extends StatefulWidget {

  final BottomNavigationEnum bottomNavigation;
  final Function (BottomNavigationEnum ,int) onTap;

  const BottomNavigationWidget({super.key, required this.bottomNavigation, required this.onTap});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        InkWell(
          onTap: (){
            widget.onTap(BottomNavigationEnum.SEARCH,2);
          },
          child: Padding(
            padding: EdgeInsetsDirectional.only(bottom: size.width * 0.11),
            child: CircleAvatar(
              radius: size.width * 0.08,
              backgroundColor: widget.bottomNavigation==BottomNavigationEnum.SEARCH ? Colors.teal : Colors.grey,
              child: Icon(Icons.search , color: Colors.white,),
            ),
          ),
        ),

        CustomPaint(
          painter: ClipShadowShadowPainter(
            shadow: Shadow(
                blurRadius: 12,
                offset: Offset(0, 1),
                color: AppColors.mainTextColor2
            ),
            clipper: BottomClip(),
          ),
          child: ClipPath(
            clipper: BottomClip(),
            child: Container(
              width: size.width,
              height: size.width * 0.2,
              color: AppColors.mainWhiteColor,
            ),
          ),
        ),
        PositionedDirectional(
          bottom: size.width * 0.05,
          start: size.width * 0.05,
          end: size.width * 0.05,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: size.width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    navItem(
                        onTap: (){
                          widget.onTap(BottomNavigationEnum.HOME,0);
                        },
                        size: size,
                        iconName: Icons.home_outlined,
                        text: 'Home',
                        isSelected: widget.bottomNavigation == BottomNavigationEnum.HOME),
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    navItem(
                        onTap: (){
                          widget.onTap(BottomNavigationEnum.PROJECTS,1);
                        },
                        size: size,
                        iconName: Icons.home_work_outlined,
                        text: 'Projects',
                        isSelected: widget.bottomNavigation == BottomNavigationEnum.PROJECTS),
                  ],
                ),
                Row(
                  children: [
                    navItem(
                        onTap: (){
                          widget.onTap(BottomNavigationEnum.FAVORITES,3);
                        },
                        size: size,
                        iconName: Icons.favorite_border,
                        text: 'Favorites',
                        isSelected: widget.bottomNavigation == BottomNavigationEnum.FAVORITES),
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    navItem(
                        onTap: (){
                          widget.onTap(BottomNavigationEnum.PROFILE,4);
                        },
                        size: size,
                        iconName: Icons.person_2_outlined,
                        text: 'Profile',
                        isSelected: widget.bottomNavigation == BottomNavigationEnum.PROFILE),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget navItem({
    required Size size,
    required IconData iconName,
    required String text,
    required bool isSelected,
    required Function onTap,
  }) {
    return InkWell(
      onTap: (){ onTap(); },
      child: Column(
        children: [
          Icon(iconName , color: isSelected ? Colors.teal : AppColors.mainTextColor2),
          Text(text,style: TextStyle(color: isSelected ? Colors.teal : AppColors.mainTextColor2),),
        ],
      ),
    );
  }
}


class BottomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width * 0.3381500, 0);
    path0.quadraticBezierTo(size.width * 0.3731500, size.height * 0.0069000, size.width * 0.3757000, size.height * 0.1236000);
    path0.quadraticBezierTo(size.width * 0.4022000, size.height * 0.5633000, size.width * 0.5006000, size.height * 0.5896000);
    path0.quadraticBezierTo(size.width * 0.5955500, size.height * 0.5727000, size.width * 0.6200000, size.height * 0.1240000);
    path0.quadraticBezierTo(size.width * 0.6204500, size.height * -0.0157000, size.width * 0.6646000, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, 0);
    path0.lineTo(size.width * 0.6225000, size.height * 0.6100000);
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}