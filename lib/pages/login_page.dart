import 'package:flutter/material.dart';
import 'package:minimal_chat/services/auth/auth_service.dart';
import 'package:minimal_chat/components/my_button.dart';
import 'package:minimal_chat/components/my_text_fields.dart';

class loginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final void Function()? onTap;

  loginPage({super.key, required this.onTap});

  void login(BuildContext context) async {
    //auth
    final authService = AuthService();

    //try login
    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _pwController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }

    //catch error
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
              "Welcome back!",
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
            const SizedBox(
              height: 20,
            ),

            //submit button
            MyButton(
              buttonType: 'Login',
              onTap: () => login(context),
            ),
            const SizedBox(
              height: 10,
            ),
            //don't have an account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not have an account?',
                    style: TextStyle(color: Colors.grey.shade700)),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    ' Register now!',
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
