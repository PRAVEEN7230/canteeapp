import 'dart:async';
import 'package:canteeapp/pages/home/home_page.dart';
import 'package:canteeapp/utils/colors.dart';
import 'package:canteeapp/utils/dimensions.dart';
import 'package:canteeapp/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2)
    )..forward();
    animation = CurvedAnimation(
        parent: controller,
        curve: Curves.linear
    );
    Timer(
        Duration(seconds: 3),
        ()=>Get.to(() => HomePage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScaleTransition(
            scale: animation,
            child: Center(child: Image.asset("assets/image/1024.png", width: 200,))
        ),
        Center(child: BigText(text: "Cantee", color: AppColors.mainColor, size: Dimensions.font16*2,))
      ],
    ));
  }
}
