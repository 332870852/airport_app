import 'dart:io';

import 'package:flutter/material.dart';
import 'main.dart';


class SplashScreen extends StatefulWidget {

  _SplashScreenStae createState()=>_SplashScreenStae();

}

class _SplashScreenStae extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller; //动画控制器
  Animation _animation; //动画


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    //监听状态
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => App()),
            (route) => route == null);
      }
    });

    _controller.forward();//播放动画
  }

  @override
  void dispose() {
    _controller.dispose(); //销毁动画控制器
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.asset('assets/images/indexanimate.jpg', scale: 1.0,fit: BoxFit.cover,),
    );

  }
}


