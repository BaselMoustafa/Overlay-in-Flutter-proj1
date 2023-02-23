import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:overlay_proj1/style/color_manager.dart';
import 'package:overlay_proj1/widgets/body_widget.dart';

class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({super.key});

  @override
  State<CustomFloatingActionButton> createState() => _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState extends State<CustomFloatingActionButton> {
  bool _overlayIsVisible=false;
  Color? _color=ColorManager.green;
  IconData _iconData=Icons.add;

  OverlayEntry?_overlayEntry;
  
  void _onPressedOfFAB() {
    _overlayIsVisible=!_overlayIsVisible;
    _updateUi();
    _overlayIsVisible? showOverlay():removeOverlay();
  }
  
  void showOverlay() {
    OverlayState overlayState=Overlay.of(context);//Will be used to INSERT entery
    _overlayEntry= OverlayEntry(                  //Contain our widget + will be used to REMOVE entery
      builder: (context)=>const Positioned(        
        left: 30,top:125 ,                        
        child: BuildYourCustomizedWidget(),       //Add your customized widget here
      ),
    );
    overlayState.insert(_overlayEntry!);          //Inserted Successfully
  }
  
  void removeOverlay() {
    _overlayEntry!.remove();                      //removed Successfully
  }

  void _updateUi() {
    _overlayIsVisible?_color=ColorManager.red:_color=ColorManager.green ;
    _overlayIsVisible?_iconData=Icons.remove:_iconData=Icons.add;
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorManager.transparent,
      elevation: 0,
      onPressed: _onPressedOfFAB,
      child: _getDesignOfButton(),
    );
  }

  AnimatedContainer _getDesignOfButton() {
    return AnimatedContainer(
      padding:const EdgeInsets.all(5),
      duration: const Duration(seconds: 1),
      decoration: _getContainerDecoration(),
      child: Align(child: Icon(_iconData,size: 30,)),
    );
  }
  
  BoxDecoration _getContainerDecoration() {
    return BoxDecoration(
      color: _color,
      shape: BoxShape.circle,
    );
  }

}