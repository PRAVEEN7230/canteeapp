import 'package:canteeapp/utils/colors.dart';
import 'package:canteeapp/widgets/big_text.dart';
import 'package:canteeapp/widgets/small_text.dart';
import 'package:flutter/material.dart';

import 'home_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.only(left: 30, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Jaipur", color: AppColors.mainColor,),
                      Row(
                        children: [
                          SmallText(text: "Kukas", color: Colors.black54,),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    child: Icon(Icons.search, color: Colors.white,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15),
                      color: AppColors.mainColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          FoodPageBody(),
        ],
      )
    );
  }
}
