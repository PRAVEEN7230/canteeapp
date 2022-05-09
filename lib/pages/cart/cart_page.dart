import 'package:canteeapp/pages/food/recommended_food_detail.dart';
import 'package:canteeapp/pages/home/home_page.dart';
import 'package:canteeapp/utils/colors.dart';
import 'package:canteeapp/utils/dimensions.dart';
import 'package:canteeapp/widgets/app_icon.dart';
import 'package:canteeapp/widgets/big_text.dart';
import 'package:canteeapp/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantity = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height10, left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                    )
                ),
                Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          Get.to(()=>HomePage());
                        },
                        child: AppIcon(
                          icon: Icons.home_outlined,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                          iconSize: Dimensions.iconSize24,
                        )
                    ),
                    SizedBox(width: Dimensions.width45,),
                    GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: AppIcon(
                          icon: Icons.shopping_cart_outlined,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                        )
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        Get.to(()=>RecommendedFoodDetail(index: (index+5)*11), transition: Transition.fadeIn, );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
                        child: Row(
                          children: [
                            //image section
                            Container(
                              width: Dimensions.width20*6,
                              height: Dimensions.height20*6,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                  color: Colors.white38,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/image/food${(index+5)*11}.png"
                                      )
                                  )
                              ),
                            ),
                            //text section
                            Expanded(
                              child: Container(
                                height: Dimensions.height20*5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(Dimensions.radius20),
                                        bottomRight: Radius.circular(Dimensions.radius20)
                                    ),
                                    color: Colors.white
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      BigText(text: "Nutritious fruit meal in jaipur"),
                                      SizedBox(height: Dimensions.height10,),
                                      SmallText(text: "With indian characteristics"),
                                      SizedBox(height: Dimensions.height10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(text: "₹ 25", color: Colors.red,),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: quantity>1?(){
                                                  setState(() {
                                                    quantity--;
                                                  });
                                                }:null,
                                                child: Icon(Icons.remove, color: quantity>1?AppColors.mainColor:AppColors.signColor,),
                                              ),
                                              SizedBox(width: Dimensions.width10/2,),
                                              BigText(text: quantity.toString()),
                                              SizedBox(width: Dimensions.width10/2,),
                                              GestureDetector(
                                                  onTap: quantity<20?(){
                                                    setState(() {
                                                      quantity++;
                                                    });
                                                  }:null,
                                                  child: Icon(Icons.add, color: quantity<20?AppColors.mainColor:AppColors.signColor,)
                                              ),

                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      )
    );
  }
}
