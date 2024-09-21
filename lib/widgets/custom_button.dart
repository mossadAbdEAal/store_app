import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Custombutton extends StatelessWidget
{
  Custombutton({super.key,required this.buttonname,required this.ontap});
  String? buttonname;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ontap,
      child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  height: 40,
                  width: double.infinity,
                  child:  Center(
                      child: Text(
                    buttonname!,
                    style: const TextStyle(fontSize: 15, fontFamily: 'Pacifico'),
                  )),
                ),
    );
  }
  
}