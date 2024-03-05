import 'package:flutter/material.dart';
import 'package:minimal_chat/services/auth/auth_service.dart';
import 'package:minimal_chat/components/my_button.dart';
import 'package:minimal_chat/components/my_text_fields.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  //register method
  void register(BuildContext context) {
    //get auth service
    final auth = AuthService();

    //password match -> create user
    if (_pwController.text == _confirmPwController.text) {
      try {
        auth.signUpWithEmailPassword(_emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }
    //password don't match
    else{
      showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  title: Text("Passwords don't match!"),
                ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.secondary,
            ),

            //welcome back
            Text(
              "Let's create an account!",
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),

            //email textfield
            const SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: _emailController,
              hintText: 'Email',
              obsecureFlag: false,
            ),

            //password text field
            MyTextField(
              controller: _pwController,
              hintText: 'Password',
              obsecureFlag: true,
            ),

            //confirm password text field
            MyTextField(
              controller: _confirmPwController,
              hintText: 'Confirm Password',
              obsecureFlag: true,
            ),
            const SizedBox(
              height: 20,
            ),

            //submit button
            MyButton(
              buttonType: 'Register',
              onTap: () => register(context),
            ),
            const SizedBox(
              height: 10,
            ),

            //Already have an account?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?',
                    style: TextStyle(color: Colors.grey.shade700)),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    ' Login now!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
