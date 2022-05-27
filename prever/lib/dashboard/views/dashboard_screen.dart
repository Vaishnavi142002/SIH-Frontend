import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prever/dashboard/controllers/dashboard_controller.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({ Key? key }) : super(key: key);
  DashBoardController dashBoardController = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 200,
          alignment: Alignment.center,
          child: Text("Hello Welcome To Prever"),
          
        ),

        RaisedButton(
        
          onPressed: (){
            dashBoardController.incrementCounter();
          },
          child: Text("+"),
          padding: EdgeInsets.all(10),
          color: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
        ),
        GetBuilder<DashBoardController>(
          init: DashBoardController(),
          builder: (controller) {
            return Text(controller.counter.toString(),style: TextStyle(fontSize: 24),);
          }
        )
      ],

    );
  }
}