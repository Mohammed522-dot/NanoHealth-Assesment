import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nano_health_assesment/constant/color.dart';
import 'package:nano_health_assesment/presentation/blocs/auth/AuthBloc.dart';
import 'package:nano_health_assesment/presentation/blocs/auth/AuthEvent.dart';

class CustomFormButton extends StatelessWidget {
  final String innerText;
  final TextEditingController userName;
  final TextEditingController password;
  final void Function()? onPressed;
  const CustomFormButton({Key? key, required this.innerText, required this.onPressed,required this.userName,required this.password}) : super(key: key);

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
      BlocProvider.of<AuthBloc>(context).add(Login(userName.text, password.text));
    },

        child: Text(innerText, style: const TextStyle(color: Colors.white, fontSize: 20),),
      ),
    );
  }
}