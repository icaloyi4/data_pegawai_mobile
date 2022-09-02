import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:animated_check/animated_check.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/routing/page_routing.dart';
import 'package:ojrek_hris/core/widget/styling.dart';

import '../../../core/assets/my_enum.dart';

class RegisterSuccessPage extends StatefulWidget {
  @override
  _RegisterSuccessPage createState() => _RegisterSuccessPage();
}

class _RegisterSuccessPage extends State<RegisterSuccessPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  late Timer _timer;
  int _start = 5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = new Tween<double>(begin: 0, end: 1).animate(
        new CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutCirc));

    _animationController.forward();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 1) {
          setState(() {
            Get.offAllNamed(PageRouting.HOME);
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainColor,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ZoomIn(
                  child: Container(
                      width: 250,
                      height: 250,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white, // border color
                        shape: BoxShape.circle,
                      ),
                      child: AnimatedCheck(
                        color: MyColors.mainColor,
                        progress: _animation,
                        size: 200,
                      ))),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                child: Text(
                  "Register Success",
                  style: styleHeader(
                      color: Colors.white,
                      textStyleWeight: TextStyleWeight.Title),
                ),
              ),
              Text(
                "Redirect to homepage in $_start",
                style: styleHeader(
                    color: Colors.white,
                    textStyleWeight: TextStyleWeight.subtitle3),
              )
            ],
          ),
        ),
      ),
    );
  }
}
