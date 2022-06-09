
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  String title;
  double width;
  double height;
  Function () onPressed;

  PrimaryButton({ Key? key ,required this.title,required this.width,required this.height,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(width.toString()+height.toString());
    return ElevatedButton(onPressed: onPressed,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right:width/15),
          child: Text(title,),
        ),
        Icon(Icons.arrow_forward)
      ],
    ),
    
    style: ElevatedButton.styleFrom(
      minimumSize: Size(width, height),
      primary: Color(0xff023E8A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      textStyle: TextStyle(
        fontSize: 18,
        letterSpacing: 0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        overflow: TextOverflow.visible,
        fontFamily: "Outfit"
      )

      
    ),

  );
  }
}