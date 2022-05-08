import 'package:canteeapp/pages/food/popular_food_details.dart';
import 'package:canteeapp/pages/food/recommended_food_detail.dart';
import 'package:canteeapp/utils/colors.dart';
import 'package:canteeapp/utils/dimensions.dart';
import 'package:canteeapp/widgets/app_column.dart';
import 'package:canteeapp/widgets/icon_and_text.dart';
import 'package:canteeapp/widgets/big_text.dart';
import 'package:canteeapp/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Slider section
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, index){
            return GestureDetector(
                onTap: (){
                  Get.to(()=>PopularFoodDetails(index: (index+5)*11), transition: Transition.fadeIn);
                },
                child: _buildPageItem(index)
            );
          }),
        ),
        //Dots section
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
          ),
        ),
        //Recommended text
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26,),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: SmallText(text: "Food pairing",),
              )
            ],
          ),
        ),
        //List of food
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
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
                      width: Dimensions.listViewImgSize,
                      height: Dimensions.listViewImgSize,
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
                        height: Dimensions.listViewTextContSize,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(text: "Nutritious fruit meal in jaipur"),
                              SizedBox(height: Dimensions.height10,),
                              SmallText(text: "With indian characteristics"),
                              SizedBox(height: Dimensions.height10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndText(
                                      text: "Normal",
                                      icon: Icons.circle_sharp ,
                                      iconColor: AppColors.iconColor1
                                  ),
                                  IconAndText(
                                      text: "0.5Km",
                                      icon: Icons.location_on ,
                                      iconColor: AppColors.mainColor
                                  ),
                                  IconAndText(
                                      text: "15min",
                                      icon: Icons.access_time_rounded,
                                      iconColor: AppColors.iconColor2
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          })
      ],
    );
  }

  Widget _buildPageItem(int index){
    Matrix4 matrix = Matrix4.identity();
    if(index == _currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale,1)..setTranslationRaw(0, currTrans, 0);

    }else if(index == _currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale,1);
      matrix = Matrix4.diagonal3Values(1, currScale,1)..setTranslationRaw(0, currTrans, 0);
    }else if(index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale,1);
      matrix = Matrix4.diagonal3Values(1, currScale,1)..setTranslationRaw(0, currTrans, 0);
    }else{
      var currScale = 0.8;
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale,1)..setTranslationRaw(0, currTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(Dimensions.height30),
                color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food${(index+5)*11}.png"),
                )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(Dimensions.height30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)
                    ),
                  ]
              ),
             child: Container(
               padding: EdgeInsets.only(top: Dimensions.height10, left: Dimensions.width15, right: Dimensions.width15),
               child: AppColumn(text: "Fast Food",),
             ),
            ),
          )
        ],
      ),
    );
  }

}