import 'package:canteeapp/pages/cart/cart_page.dart';
import 'package:canteeapp/utils/colors.dart';
import 'package:canteeapp/utils/dimensions.dart';
import 'package:canteeapp/widgets/app_icon.dart';
import 'package:canteeapp/widgets/big_text.dart';
import 'package:canteeapp/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatefulWidget {
  final int index;

  const RecommendedFoodDetail({Key? key, required this.index}) : super(key: key);

  @override
  State<RecommendedFoodDetail> createState() => _RecommendedFoodDetailState(index);
}

class _RecommendedFoodDetailState extends State<RecommendedFoodDetail> {
  int foodPrice = 15;
  int quantity = 1;
  bool favCheck = false;
  int index;
  _RecommendedFoodDetailState(this.index);
  @override
  Widget build(BuildContext context) {
    int totalPrice = foodPrice*quantity;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: AppIcon(icon: Icons.clear),
                ),
                GestureDetector(
                    onTap: (){
                      Get.to(()=> CartPage());
                    },
                    child: AppIcon(icon:Icons.shopping_cart_outlined),
                ),
              ],
            ), // Row
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimensions.height20),
                child: Container (
                  child: Center (child: BigText(size:Dimensions.font26,text: "Chinese Side")),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top:Dimensions.height10/2, bottom: Dimensions.height10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular (Dimensions.radius20),
                      topRight: Radius.circular (Dimensions.radius20)
                  ) // BorderRadius.only
                ), // Container
              ),
            ),// PreferredSize
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: Dimensions.height20*15,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food$index.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ), // Image.asset
            ), // FlexibleSpaceBar
          ), // Sliver AppBar
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container (
                  margin: EdgeInsets.only (left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableTextWidget(text: "Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly sp...."
                      "Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly"
                      "Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly"
                      "Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly"
                      "Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly"
                      "Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly"
                      "Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightlyChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightlyChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly"
                      "Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly"
                      "Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightlyChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly"
                      "Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly"
                      "Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly"
                      "Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly"
                      "Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly"
                  ),
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
                  GestureDetector(
                    onTap: quantity>1?(){
                      setState(() {
                        quantity--;
                      });
                    }:null,
                    child: AppIcon(
                        iconSize: Dimensions.iconSize24,
                        iconColor:Colors.white,
                        backgroundColor: quantity>1?AppColors.mainColor:AppColors.signColor,
                        icon: Icons.remove
                    ),
                  ),
                  BigText(text: "₹ $foodPrice "+" X "+" $quantity ", color: AppColors.mainBlackColor, size: Dimensions.font26,),
                  GestureDetector(
                    onTap: quantity<20?(){
                      setState(() {
                        quantity++;
                      });
                    }:null,
                    child: AppIcon(
                        iconSize: Dimensions.iconSize24,
                        iconColor:Colors.white,
                        backgroundColor: quantity<20?AppColors.mainColor:AppColors.signColor,
                        icon: Icons.add
                    ),
                  ),
                ],
            ) // Row
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20*2),
                    topRight: Radius.circular(Dimensions.radius20*2)
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      favCheck = !favCheck;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: favCheck?AppColors.mainColor:AppColors.signColor,
                    )
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.snackbar("Added in Cart", "Product $index", duration: Duration(seconds: 1));
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: totalPrice>0?AppColors.mainColor:AppColors.signColor,
                    ),
                    child: BigText(text: "₹ $totalPrice | Add to cart", color: Colors.white,),
                  ),
                )
              ],
            ),
          ),// container
        ],
      ), // Column
    ); // Scaffold
  }
}
