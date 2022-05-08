import 'package:canteeapp/utils/colors.dart';
import 'package:canteeapp/utils/dimensions.dart';
import 'package:canteeapp/widgets/big_text.dart';
import 'package:canteeapp/widgets/icon_and_text.dart';
import 'package:canteeapp/widgets/small_text.dart';
import 'package:flutter/material.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26,),
        SizedBox(height: Dimensions.height10,),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) =>  Icon(Icons.star, color: AppColors.mainColor, size: Dimensions.iconSize16,)),
            ),
            SizedBox(width: Dimensions.width10),
            SmallText(text: "4.5"),
            SizedBox(width: Dimensions.width10,),
            SmallText(text: "1245"),
            SizedBox(width: Dimensions.width10,),
            SmallText(text: "Comments")
          ],
        ),
        SizedBox(height: Dimensions.height20,),
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
    );
  }
}
