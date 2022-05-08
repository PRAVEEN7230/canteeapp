import 'package:canteeapp/utils/dimensions.dart';
import 'package:canteeapp/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndText({Key? key,
    required this.text,
    required this.icon,
    required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.iconSize24,),
        SizedBox(width: 5,),
        SmallText(text: text),
      ],
    );
  }
}
