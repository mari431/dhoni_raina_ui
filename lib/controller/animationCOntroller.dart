
import 'package:dhoni_raina_ui/constants/players_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestAnimationController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController animationController;

  final _isAnimating = true.obs;
  get isAnimating => _isAnimating.value;
  set isAnimating(value) {
    _isAnimating.value = value;
  }



  @override
  void onInit() {
    isAnimating = true;

    animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 5000,
        ));
    animationController.repeat();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
  }

  startAnimation() {
    if (animationController.isAnimating == true) {
      isAnimating = false;
      animationController.stop();
    } else {
      isAnimating = true;
      animationController.forward();
      animationController.repeat();
    }
  }


  void showBottomSheet(int index) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.grey.shade50,width: 0.1)
        ),
        height: 300,
        child: Center(
          child: Text(playerItems[index]['description'],
            style: TextStyle(fontSize: 18,color: Colors.white),
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

}
