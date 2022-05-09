import 'package:canteeapp/pages/cart/cart_page.dart';
import 'package:canteeapp/utils/colors.dart';
import 'package:canteeapp/utils/dimensions.dart';
import 'package:canteeapp/widgets/app_column.dart';
import 'package:canteeapp/widgets/app_icon.dart';
import 'package:canteeapp/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularFoodDetails extends StatefulWidget {
  final int index;
  const PopularFoodDetails({Key? key, required this.index}) : super(key: key);

  @override
  State<PopularFoodDetails> createState() => _PopularFoodDetailsState(index);
}

class _PopularFoodDetailsState extends State<PopularFoodDetails> {
  int foodPrice = 15;
  int quantity = 1;
  int index;

  _PopularFoodDetailsState(this.index);
  @override
  Widget build(BuildContext context) {
    int totalPrice = foodPrice*quantity;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/image/food$index.png"
                  )
                )
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios)
                ),
                GestureDetector(
                    onTap: (){
                      Get.to(()=> CartPage());
                    },
                    child: AppIcon(icon: Icons.shopping_cart_outlined)
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize-20,
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20)
                ),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Special Samosa",),
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: "Introduce")
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
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
      ),
    );
  }
}
