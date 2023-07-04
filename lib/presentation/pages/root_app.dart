import 'package:flutter/material.dart';
import 'package:nano_health_assesment/constant/color.dart';
import 'package:nano_health_assesment/presentation/pages/home_page.dart';

import '../widgets/botom_bar.dart';

class RootApp extends StatefulWidget {
  const RootApp({ Key? key }) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp>  with TickerProviderStateMixin{
  int activeTab = 0;
  late List barItems;
//====== set animation=====
  late final AnimationController _controller = AnimationController(
    duration:  const Duration(milliseconds: 3000),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  animatedPage(page){
    return FadeTransition(
        child: page,
        opacity: _animation
    );
  }

  void onPageChanged(int index) {
    _controller.reset();
    setState(() {
      activeTab = index;
    });
    _controller.forward();
  }

//====== end set animation=====

  @override
  Widget build(BuildContext context) {
    barItems = [
      {
        "icon" : "assets/icons/list.svg",
        "active_icon" : "assets/icons/list.svg",
        "page" : const HomePage(),
      },
      {
        "icon" : "assets/icons/shop.svg",
        "active_icon" : "assets/icons/shop.svg",
        "page" : Container(),
      },
      {
        "icon" : "assets/icons/like.svg",
        "active_icon" : "assets/icons/like.svg",
        "page" : Container(),
      },

      {
        "icon" : "assets/icons/profile.svg",
        "active_icon" : "assets/icons/profile.svg",
        "page" : Container(),

      },
    ];
    return Scaffold(
        backgroundColor: appBgColor,
        bottomNavigationBar: getBottomBar(),
        body: getBarPage()
    );
  }

  Widget getBarPage(){
    return
      IndexedStack(
          index: activeTab,
          children:
          List.generate(barItems.length,
                  (index) => animatedPage(barItems[index]["page"])
          )
      );
  }

  Widget getBottomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
          color: bottomBarColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25)
          ),
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(1, 1)
            )
          ]
      ),
      child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25,),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(barItems.length,
                      (index) =>  Column(
                    children: [
                      BottomBarItem(barItems[index]["icon"], isActive: activeTab == index, activeColor: primary,
                        onTap: (){
                          onPageChanged(index);
                        },
                      ),
                    ],
                  )
              )
          )
      ),
    );
  }

}