import 'package:canteeapp/utils/colors.dart';
import 'package:canteeapp/utils/dimentions.dart';
import 'package:canteeapp/utils/icon_and_text.dart';
import 'package:canteeapp/widgets/big_text.dart';
import 'package:canteeapp/widgets/small_text.dart';
import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.0;
  double _height = 220;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, index){
        return _buildPageItem(index);
      }),
    );
  }

  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();
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

    return Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(Dimentions.height30),
              color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/food0.png"),
              )
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(Dimentions.height30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                  )
                ]
            ),
           child: Container(
             padding: EdgeInsets.only(top: 10, left: 15, right: 15),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 BigText(text: 'Chinese Side'),
                 SizedBox(height: Dimentions.height10,),
                 Row(
                   children: [
                     Wrap(
                       children: List.generate(5, (index) =>  Icon(Icons.star, color: AppColors.mainColor, size: 15,)),
                     ),
                     SizedBox(width: 10),
                     SmallText(text: "4.5"),
                     SizedBox(width: 10,),
                     SmallText(text: "1245"),
                     SizedBox(width: 10,),
                     SmallText(text: "Comments")
                   ],
                 ),
                 SizedBox(height: Dimentions.height20,),
                 Row(
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
    );
  }

}