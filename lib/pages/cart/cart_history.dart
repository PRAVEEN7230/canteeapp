import 'package:canteeapp/utils/colors.dart';
import 'package:canteeapp/utils/dimensions.dart';
import 'package:canteeapp/widgets/app_icon.dart';
import 'package:canteeapp/widgets/big_text.dart';
import 'package:canteeapp/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                BigText(text: "Cart History", color: Colors.white,),
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
          ),
          Expanded(
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Container(
                      height: Dimensions.height30*4,
                      margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: "${index+7}/05/2022"),
                          SizedBox(height: Dimensions.height10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children: List.generate(index%3+1, (ind){
                                  return Container(
                                    height: Dimensions.height20*4,
                                    width: Dimensions.width20*4,
                                    margin: EdgeInsets.only(right: Dimensions.width10/2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                                      image: DecorationImage(
                                          image: AssetImage("assets/image/food${((index+ind)%4+5)*11}.png")
                                      )
                                    ),
                                  );
                                }),
                              ),
                              Container(
                                height: Dimensions.height20*4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SmallText(text: "Total", color: AppColors.titleColor,),
                                    BigText(text: (index%3+1).toString()+" Items", color: AppColors.titleColor,),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.width10,
                                        vertical: Dimensions.height10/2
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.radius15/3),
                                        border: Border.all(width: 1, color: AppColors.mainColor),
                                      ),
                                      child: SmallText(text: "one more", color: AppColors.mainColor,),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            ),
          )
        ],
      ),
    );
  }
}
