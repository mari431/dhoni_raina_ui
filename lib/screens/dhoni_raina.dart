import 'package:card_swiper/card_swiper.dart';
import 'package:dhoni_raina_ui/constants/players_item.dart';
import 'package:dhoni_raina_ui/controller/animationCOntroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DhoniRaina extends StatelessWidget {
  DhoniRaina({super.key});

  final TestAnimationController animationPutController =
      Get.put(TestAnimationController());

  @override
  Widget build(BuildContext context) {
    return Swiper(
          layout: SwiperLayout.CUSTOM,
          customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
    ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
    ..addTranslate(
        [Offset(-370.0, -40.0), Offset(0.0, 0.0), Offset(370.0, -40.0)]),
          itemWidth: 350.0,
          itemHeight: 750.0,
          itemBuilder: (context, index) {
    return Container(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
            RotationTransition(
              turns: Tween(
                begin: 0.0,
                end: 1.0,
              ).animate(animationPutController.animationController),
              child: Container(
                padding: EdgeInsets.all(2),
                width: 510,
                height: 580,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  // border: Border.all(color: Colors.yellow, width: 5),
                ),
                child: Center(
                  child: Image.asset(
                    'images/csk.png',
                  ),
                ),
              ),
            ),

            Positioned(
              top: 0,
              right: 5,
              left: 5,
              bottom: 0,
              child: InkWell(
                onTap: (){
                  animationPutController.showBottomSheet(index);
                },
                child: Image.asset(
                  playerItems[index]["img"],
                ),
              ),
            ),
            Positioned(
              top: 420,
              right: 5,
              left: 5,
              bottom: 0,
              child: Center(
                child: Text(
                  '${playerItems[index]['title']}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.yellow,
                      shadows: [
                        Shadow(
                            color: Colors.lightGreenAccent,
                            offset: Offset(2, 0),
                            blurRadius: 15)
                      ]),
                ),
              ),
            ),
            // ElevatedButton(
            //   onPressed: (){
            //     animationPutController.startAnimation();
            //   },
            //   child:
            //   Obx(() =>
            //      Text(animationPutController.isAnimating == true ? 'Stop' : 'Start'),
            //   ),
            // ),
          ],),



        ],
      ),
    );
          },
          itemCount: playerItems.length,
        );
  }
}
