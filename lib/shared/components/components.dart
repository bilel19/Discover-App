import 'package:discover_app/misc/colors.dart';
import 'package:flutter/material.dart';

Widget defaultButton({width, isResponsive = false, text}) => Container(
  padding: EdgeInsets.symmetric(horizontal: 20),
      width: width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(isResponsive==true)
          Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          Image(
            image: AssetImage('assets/images/button-one.png'),
            height: 40,
          ),
        ],
      ),
    );


void NavigateAndFinish(context,widget)=>Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder: (context)=>widget), (route) => false);

void NavigateTo(context,widget)=>Navigator.push(context,
    MaterialPageRoute(builder: (context)=>widget));