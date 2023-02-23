import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_proj1/style/color_manager.dart';
import 'package:overlay_proj1/widgets/custom_floating_action_button.dart';

class TestScreen extends StatelessWidget {
  List<List<Color>>colors=[
    [Colors.blueGrey,Colors.blueGrey.withOpacity(0.7)],
    [Colors.deepPurple,Colors.deepPurple.withOpacity(0.7)],
    [Colors.lightBlue,Colors.lightBlue.withOpacity(0.7)],
    [Colors.deepOrange,Colors.deepOrange.withOpacity(0.7)],
    [Colors.yellow[400]!,Colors.yellow[400]!.withOpacity(0.7)], 
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBodyWidget(),
      floatingActionButton:const CustomFloatingActionButton(),
    );
  }
  
  Widget _getBodyWidget(){
    return ListView(
      children: [
        for(int i=0;i<10;i++)
        Container(
          height: 150,
          decoration: _getContainerDecoration(i),
          margin:const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          child:const Center(child: FlutterLogo(size: 50,)),
        ),
      ],
    );
  }

  BoxDecoration _getContainerDecoration(int i) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors:i<colors.length?colors[i]:colors[i-colors.length],
        ),
      borderRadius: BorderRadius.circular(10));
  }
  
  PreferredSizeWidget _getAppBar(){
    return AppBar(
      elevation: 0,
      title:const Text("Overlay Example"),
      titleTextStyle:const TextStyle(color: ColorManager.black,fontSize: 26,fontWeight: FontWeight.w700),
      centerTitle: true,
      backgroundColor: ColorManager.transparent,
      systemOverlayStyle:const SystemUiOverlayStyle(
        statusBarColor: ColorManager.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}