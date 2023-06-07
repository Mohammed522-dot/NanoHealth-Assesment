import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nano_health_assesment/color.dart';
import 'package:nano_health_assesment/presentation/blocs/AuthState.dart';
import 'package:nano_health_assesment/presentation/pages/root_app.dart';
import 'package:nano_health_assesment/presentation/widgets/custom_button.dart';
import 'package:nano_health_assesment/presentation/widgets/custom_input.dart';
import 'package:nano_health_assesment/presentation/widgets/page_handeling.dart';
import 'package:nano_health_assesment/presentation/widgets/page_header.dart';

import '../blocs/AuthBloc.dart';
import '../widgets/loding_widget.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController userName;
  late TextEditingController password;
  final _loginFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    userName = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc())
      ],
      child: BlocConsumer<AuthBloc,AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              print("error");
            } else if (state is AuthLoaded) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> RootApp()));
            }
            else if (state is ResponseError) {
              // ResponseErrorLayout();
              print("error");
            }
          },
        builder: (context, state) {
          if (state is AuthLoading) {
            return LoadingWidget(child: buildInitialInput());
          } else {
            return buildInitialInput();
          }
        },
      ),
    );
  }
  Widget buildInitialInput() =>
      SafeArea(
        child: Scaffold(
          backgroundColor: primary2,
          body: Column(
            children: [
              const PageHeader(),
              const PageHeading(title: 'Log In',),

              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,

                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [

                        CustomInputField(
                            labelText: 'Email',
                            textController: userName,
                            validator: (textValue) {
                              if(textValue == null || textValue.isEmpty) {
                                return 'Email is required!';
                              }
                              // if(!EmailValidator.validate(textValue)) {
                              //   return 'Please enter a valid email';
                              // }
                              return null;
                            }
                        ),
                        const SizedBox(height: 16,),
                        CustomInputField(
                          labelText: 'Password',
                          textController: password,
                          obscureText: true,
                          suffixIcon: true,
                          validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'Password is required!';
                            }
                            return null;
                          },
                        ),


                        const SizedBox(height: 20,),
                        CustomFormButton(
                          userName: userName,
                          password: password,
                          innerText: 'Continue', onPressed: _handleLoginUser,),
                        const SizedBox(height: 18,),
                        SizedBox(
                          width:  0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('NEED HELPE?', style: TextStyle(fontSize: 13, color: Color(0xff939393), fontWeight: FontWeight.bold),),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  void _handleLoginUser() {
    // login user
    if (_loginFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Submitting data..')),
      );
    }
  }
}