import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:prever/components/buttons.dart';
import 'package:prever/components/textfields.dart';
import 'package:prever/components/themes.dart';
import 'package:prever/register/views/register_view.dart';

class LoginView extends StatelessWidget {
  LoginView({ Key? key }) : super(key: key);
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: Get.width/5,
        toolbarHeight: Get.height/10,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.only(left: 10,top: 10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              semanticContainer: true,
              elevation: 7.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Get.height/10)),
              child: Icon(Icons.arrow_back,color: Colors.black,size: 30,),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: Get.height/5,left: Get.height/25,right: Get.width*0.05),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hey,\nLogin Now",textAlign: TextAlign.left,style: Theme.of(context).textTheme.headline1,),
                Padding(
                  padding: const EdgeInsets.only(top:15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("If You are New / ",style: Theme.of(context).textTheme.headline2,),
                      GestureDetector(
                        onTap: (){
                        debugPrint("Register");
                      }, 
                      
                      child: GestureDetector(
                        onTap: (){
                          Get.to(RegisterView());
                        },
                        child: Text("Create New",
                            style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w800),
                          ) 
                        )
                      )
                    ],
                  ),
                ),
                
                Container(
                  margin: EdgeInsets.only(top: Get.height*0.04),
                  child: PrimaryTextField(
                    controller: phoneNumberController, 
                    labelText: "Phone Number", 
                    hintText: "Enter Mobile Number", 
                    icon: Icon(Icons.call),
                    keyboardType: TextInputType.phone,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Phone Number is required"),
                      MinLengthValidator(10, errorText: "Phone Number should be of length 10 digits"),
                      MaxLengthValidator(10, errorText: "Phone Number should not exceed 10 digits")
                    ]),
                  ),
                    
                ),
          
                Container(
                  margin: EdgeInsets.only(top: Get.height*0.04),
                  child: PrimaryTextField(
                    controller: passwordController,
                    labelText: "Password", 
                    hintText: "Enter Password", 
                    icon: Icon(Icons.visibility_off),
                    obscureText: true,
                    validator: MultiValidator([
                        RequiredValidator(errorText: "Password is required"),
                      ])
                      
                  ),
                ),
      
                Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Forgot Password/ ",style: Theme.of(context).textTheme.headline2,),
                      GestureDetector(
                        onTap: (){
                        debugPrint("Reset");
                      }, 
                      
                      child: Text("Reset",style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w800),))
                    ],
                  ),
                ),
                Row(
                  
                  children: [
                    Expanded(
                      child: Text("")
                    ),
                  
                    Padding(
                      padding: const EdgeInsets.only(top:20.0),
                      child: PrimaryButton(
                        title: "Login", 
                        width: 100,
                        height: 60,
                        onPressed: (){
                          FirebaseFirestore.instance.collection("users").add({"username":"anonymous","password":"anonymous"});
                          if(formKey.currentState!.validate()){
                             
                            Get.to(RegisterView());
                          }
                      }),
                    ),
                  ],
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}