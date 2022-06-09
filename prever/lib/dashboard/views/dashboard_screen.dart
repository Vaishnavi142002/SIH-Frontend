import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prever/components/buttons.dart';
import 'package:prever/components/textfields.dart';
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
          alignment: Alignment.center,
          child: Text("Hello Welcome To Prever"),
          
        ),

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: RaisedButton(
          
            onPressed: (){
              dashBoardController.incrementCounter();
            },
            child: Text("+",style: TextStyle(fontSize: 24),),
            padding: EdgeInsets.all(10),
            color: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
          ),
        ),
        GetBuilder<DashBoardController>(
          init: DashBoardController(),
          builder: (controller) {
            return Text(controller.counter.toString(),style: TextStyle(fontSize: 24),);
          }
        ),
        PrimaryButton(title: "Login", width: 100, height: 40, onPressed: (){
          debugPrint("hello");
        }),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: PrimaryTextField(controller: TextEditingController(),hintText: "Enter Username",labelText: "Username",icon: Icon(Icons.email_outlined),),
        )
      ],

    );
  }
}