import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:prever/components/buttons.dart';
import 'package:prever/components/textfields.dart';
import 'package:prever/components/themes.dart';

class RegisterView extends StatelessWidget {
  RegisterView({ Key? key }) : super(key: key);
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  
  void _onCountryChange(CountryCode countryCode) {
    //TODO : manipulate the selected country code here
    print("New Country selected: " + countryCode.toString());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: Get.width/5,
        toolbarHeight: Get.height/10,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (() {
            Get.back();
          }),
          child: Container(
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
                Text("Create \n a Account",textAlign: TextAlign.left,style: Theme.of(context).textTheme.headline1,),
                Padding(
                  padding: const EdgeInsets.only(top:15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Have Account? / ",style: Theme.of(context).textTheme.headline2,),
                      GestureDetector(
                        onTap: (){
                        debugPrint("Login");
                      }, 
                      child: Text("Login",style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w800),))
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
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Phone Number is required"),
                      MinLengthValidator(10, errorText: "Phone Number should be of length 10 digits"),
                      MaxLengthValidator(10, errorText: "Phone Number should not exceed 10 digits")
                    ]),
                  )
                ),

                Container(
                  margin: EdgeInsets.only(top: Get.height*0.04),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Container(
                          width: Get.width*0.40,
                          child: PrimaryTextField(
                            controller: phoneNumberController, 
                            labelText: "First Name", 
                            hintText: "Enter First Name", 
                            icon: null,
                            validator: RequiredValidator(errorText: "Required"),
                          )
                        ),
                      ),
                      Container(
                        width: Get.width*0.40,
                        child: PrimaryTextField(
                          controller: phoneNumberController, 
                          labelText: "Last Name", 
                          hintText: "Enter Last Name",
                          icon: null, 
                          validator: RequiredValidator(errorText: "Required"),
                        ),
                      ),
                    ],
                  )
                ),

                Container(
                  margin: EdgeInsets.only(top: Get.height*0.04),
                  child: PrimaryTextField(controller: passwordController, labelText: "Email", hintText: "Enter Email", icon: Icon(Icons.email_outlined),obscureText: true,),
                ),


                Container(
                  margin: EdgeInsets.only(top: Get.height*0.04),
                  child: PrimaryTextField(controller: passwordController, labelText: "Password", hintText: "Enter Password", icon: Icon(Icons.visibility_off),obscureText: true,),
                ),
      
                

                Row(

                  
                  children: [
                    Stack(
                      fit:StackFit.loose,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent
                            
                          ),
                        
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: Get.height*0.04),
                          child: CountryCodePicker(
                              flagWidth: Get.width*0.155,
                              flagDecoration: ShapeDecoration.fromBoxDecoration(
                                BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                )
                              ),
                              
                              onChanged: _onCountryChange,
                              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                              initialSelection: 'IN',
                              hideMainText: true,
                              // optional. Shows only country name and flag
                              showCountryOnly: false,
                              // optional. Shows only country name and flag when popup is closed.
                              showOnlyCountryWhenClosed: false,
                              // optional. aligns the flag and the Text left
                              alignLeft: false,
                            ),
                        ),
                        Positioned(
                          left:Get.width*0.18,
                          top: Get.height*0.065,
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(left: Get.width*0.01),
                            child: Icon(Icons.arrow_drop_down,size: 35),
                          ),
                        ),
                      ],
                    ),

                    Expanded(child: Text("")),


                    Padding(
                      padding: EdgeInsets.only(top:Get.height*0.05),
                      child: PrimaryButton(
                        title: "Create", 
                        width: 100,
                        height: 60,
                        onPressed: (){
                          if(formKey.currentState!.validate())
                            debugPrint("Create");
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