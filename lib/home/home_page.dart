import 'package:canteeapp/home/main_food_page.dart';
import 'package:canteeapp/utils/colors.dart';
import 'package:canteeapp/widgets/big_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;
  List pages=[
    MainFoodPage(),
    Container(child:Center(child: BigText(text: "Next page",))),
    Container(child:Center(child: BigText(text: "Next next.page"))),
    Container(child:Center(child: BigText(text: "Next next.next.page"))),
  ];

  void onTapNav(int index){
    setState((){
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: "home"
        ), // BottomNavigationBarItem
          BottomNavigationBarItem(
              icon: Icon(Icons.archive,),
              label: "history"
        ), // BottomNavigationBarItem
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,),
              label: "cart"
          ),// BottomNavigationBarItem
          BottomNavigationBarItem(
              icon: Icon(Icons.person,),
              label: "me"
          )// BottomNavigationBarItem
        ],
      ),
    ); // Scaffold
  }
}