

import 'package:facebook/models/story.dart';
import 'package:facebook/ui-ux/protifile.dart';
import 'package:facebook/ui-ux/story.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/helpers/enums.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import 'form.dart';
import 'home_screen.dart';

class Navi extends StatefulWidget {
  const Navi({
    Key? key,
  }) : super(key: key);

  @override
  State<Navi> createState() => _Navi();
}

class _Navi extends State<Navi> {
  dynamic selected;
  var heart = false;
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, //to make floating action button notch transparent

      //to avoid the floating action button overlapping behavior,
      // when a soft keyboard is displayed
      // resizeToAvoidBottomInset: false,

      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          // iconSize: 32,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.animated,
          // opacity: 0.3,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(
              Icons.house_outlined,
            ),
            selectedIcon: const Icon(Icons.house_rounded),
            // selectedColor: Colors.teal,
            backgroundColor: Colors.teal,
            title: const Text('Home'),
            badge: const Text('9+'),
            showBadge: true,
          ),
          BottomBarItem(
            icon: const Icon(Icons.star_border_rounded),
            selectedIcon: const Icon(Icons.star_rounded),
            selectedColor: Colors.red,
            // unSelectedColor: Colors.purple,
            // backgroundColor: Colors.orange,
            title: const Text('Star'),
          ),
          BottomBarItem(
              icon: const Icon(
                Icons.style_outlined,
              ),
              selectedIcon: const Icon(
                Icons.style,
              ),
              backgroundColor: Colors.amber,
              selectedColor: Colors.deepOrangeAccent,
              title: const Text('Style')),
          BottomBarItem(
              icon: const Icon(
                Icons.person_outline,
              ),
              selectedIcon: const Icon(
                Icons.person,
              ),
              backgroundColor: Colors.purpleAccent,
              selectedColor: Colors.deepPurple,
              title: const Text('Profile')),
          BottomBarItem(
              icon: const Icon(
                Icons.person_outline,
              ),
              selectedIcon: const Icon(
                Icons.person,
              ),
              backgroundColor: Colors.purpleAccent,
              selectedColor: Colors.deepPurple,
              title: const Text('Profile')),
        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: selected ?? 0,
        onTap: (index) {
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
      ),


      body: SafeArea(
        child: PageView(
          controller: controller,
          children: const [
            HomeScreen(),
            Center(child: Text('Star')),
            FormUser(),
          Story1(),
            ProtifileScreen(),
          ],
        ),
      ),
    );
  }
}