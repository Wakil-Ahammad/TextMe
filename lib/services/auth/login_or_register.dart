import 'package:flutter/material.dart';
import 'package:minimal_chat/pages/login_page.dart';
import 'package:minimal_chat/pages/register_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  
  //initially show login page
  bool showLoginPage = true;

  void tooglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if(showLoginPage)return loginPage(onTap: tooglePages,);
    return RegisterPage(onTap: tooglePages,);
  }
}