import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Customtextfield extends StatelessWidget {
   Customtextfield({super.key,
required this.fieldname ,
this.onchanged ,
this.obscure =false,
this.textInputType
  });
  TextEditingController controller = TextEditingController();
  String fieldname;
  Function(String)? onchanged;
  bool obscure;
  TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return  TextField(
      keyboardType: textInputType,
      obscureText: obscure,
      controller: controller ,
      onChanged: onchanged ,
        style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        // fillColor: Color.fromARGB(255, 2, 3, 105),
        // filled: true,
        focusedErrorBorder:const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        hintText: fieldname,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
