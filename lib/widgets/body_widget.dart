import 'dart:async';

import 'package:flutter/material.dart';
import 'package:overlay_proj1/style/color_manager.dart';

class BuildYourCustomizedWidget extends StatefulWidget {
  const BuildYourCustomizedWidget({super.key});

  @override
  State<BuildYourCustomizedWidget> createState() => _BuildYourCustomizedWidgetState();
}

class _BuildYourCustomizedWidgetState extends State<BuildYourCustomizedWidget> {
  late Timer _timer;
  double _height=30;
  double _width=30;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration:const Duration(milliseconds: 750),
      curve: Curves.fastOutSlowIn,
      padding:const EdgeInsets.all(20),
      height: _height,
      width: _width,
      decoration: _getContainerDecoration(),
      child: _getContentOfContainer(),
    );
  }
  @override
  void initState() {
    _timer= Timer.periodic(
      const Duration(milliseconds: 100), 
      (timer) {
        if(timer.tick<11){
          if(timer.tick==1){
            _width=300;
            setState(() {});
          }
          if(timer.tick==10){
            _height=200;
            setState(() {});
          } 
        }else{
          _timer.cancel();
        }
      }
      );
    super.initState();
  }

  DefaultTextStyle _getContentOfContainer() {
    return DefaultTextStyle(
      style:const TextStyle(color: ColorManager.white,fontWeight: FontWeight.w900),
      child: ListView(
        children:const [
          FlutterLogo(size: 50,),
          SizedBox(height: 20,),
          Center(
            child: Text(
              "Overlay in Flutter",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: Text(
              "Stack without stack !!",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  BoxDecoration _getContainerDecoration() {
    return  BoxDecoration(
      color: ColorManager.black.withOpacity(1),
      borderRadius: BorderRadius.circular(20),
    );
  }

 
  
  
}