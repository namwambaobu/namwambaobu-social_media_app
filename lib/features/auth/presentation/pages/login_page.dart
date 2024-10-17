/*

LOG IN PAGE

On this page, an existing user can login with their:

- email
- pw
------------------------------------------------------------------------------------------------------------------

Once the user sucessfully logs in, they will be redirected to home page

If user doesn't have an account yet, they can go to register page from here to Create one.

 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wegag/features/auth/presentation/components/my_button.dart';
import 'package:wegag/features/auth/presentation/components/my_text_field.dart';
import 'package:wegag/features/auth/presentation/cubits/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePages;
  const LoginPage({super.key, required this.togglePages});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//text controllers
  final emailController = TextEditingController();
  final pwController = TextEditingController();

  //login button pressed
  void login() {
    final String email = emailController.text;
    final String pw = pwController.text;

    //auth Cubit
    final authCubit = context.read<AuthCubit>();

    //ensure that the email & pw fields are not empty
    if (email.isNotEmpty && pw.isNotEmpty) {
      //login
      authCubit.login(email, pw);
    }

    //display error if some fields are empty
    else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please enter your email and password")));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }

  //BUILD UI

  @override
  Widget build(BuildContext context) {
    //SCAFFOLD
    return Scaffold(
      //BODY
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Icon(
                  Icons.lock_open_rounded,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),

                const SizedBox(height: 50),
                //welcome back message
                Text(
                  "Welcome back, we missed you 😊",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                //email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obsecureText: false,
                ),
                const SizedBox(height: 20),
                //password textfield
                MyTextField(
                  controller: pwController,
                  hintText: 'Enter Password',
                  obsecureText: true,
                ),
                const SizedBox(height: 50),

                //login button
                MyButton(
                  onTap: login,
                  text: 'Login',
                ),
                const SizedBox(height: 50),

                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member? ",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    GestureDetector(
                      onTap: widget.togglePages,
                      child: const Text(
                        "Register now",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
