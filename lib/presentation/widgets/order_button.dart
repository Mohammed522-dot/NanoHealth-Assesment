import 'package:flutter/material.dart';
import 'package:nano_health_assesment/constant/color.dart';

class OrderButton extends StatelessWidget {
  final String innerText;

  final void Function()? onPressed;
  const OrderButton({Key? key, required this.innerText, required this.onPressed,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: 50,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(26),
      ),
      child: TextButton(
        onPressed: (){

        },

        child: Text(innerText, style: const TextStyle(color: Colors.white, fontSize: 20),),
      ),
    );
  }
}