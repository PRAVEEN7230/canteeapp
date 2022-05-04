import 'package:canteeapp/utils/colors.dart';
import 'package:canteeapp/utils/dimensions.dart';
import 'package:canteeapp/widgets/app_icon.dart';
import 'package:canteeapp/widgets/big_text.dart';
import 'package:canteeapp/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';

class RecommenededFoodDetail extends StatelessWidget {
  const RecommenededFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(

            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon:Icons.shopping_cart_outlined)
              ],
            ), // Row
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container (
                  margin: EdgeInsets.only (left: Dimensions.width20, right: Dimensions.width20),
                  child: Center (child: BigText(size:Dimensions.font16,text: "Chinese Side")),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top:5, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius. circular (Dimensions. radius20),
                      topRight: Radius.circular (Dimensions.radius20)
                  ) // BorderRadius.only
                ), // Container
              ),
            ),// PreferredSize
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ), // Image.asset
            ), // FlexibleSpaceBar
          ), // Sliver AppBar
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container (
                  child: ExpandableTextWidget(text: " Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly sp...."),
                  margin: EdgeInsets.only (left: Dimensions.width20, right: Dimensions.width20),
                )// Container
              ],
            ),
          ),
        ],
      ),// CustomScrollView
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ), // EdgeInsets.only
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                      iconSize: Dimensions.iconSize24,
                      iconColor:Colors.white,
                      backgroundColor: AppColors.mainColor,
                      icon: Icons.remove),
                  AppIcon(
                      iconSize: Dimensions.iconSize24,
                      iconColor:Colors.white,
                      backgroundColor: AppColors.mainColor,
                      icon: Icons.add),
                ],
            ) // Row
          ) // container
        ],
      ), // Column
    ); // Scaffold
  }
}
