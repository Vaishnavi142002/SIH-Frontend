import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class PrimaryTextField extends StatelessWidget {
  String labelText;
  String hintText;
  Widget? icon;
  TextEditingController controller;
  bool? obscureText=false;

  TextInputType? keyboardType=TextInputType.streetAddress;

  String? Function(String?)? validator;

  PrimaryTextField({ Key? key ,required this.controller,required this.labelText,required this.hintText,required this.icon, this.obscureText,this.keyboardType,this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: null,

      child: TextFormField(
        validator: validator,
        obscureText: obscureText??false,
        controller: controller,
        style: Theme.of(context).textTheme.headline2,
        keyboardType: keyboardType,
        decoration: InputDecoration(
        
          contentPadding: EdgeInsets.only(left:30,right:20,top: 20,bottom: 20),
          labelStyle: Theme.of(context).textTheme.headline2,
          hintStyle: Theme.of(context).textTheme.headline2,
          labelText: labelText,
          hintText: hintText,
          suffixIcon: icon,
      
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(15)
          )
        ),
      ),
    );
  }
}