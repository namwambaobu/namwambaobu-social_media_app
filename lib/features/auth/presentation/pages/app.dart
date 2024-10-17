import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wegag/features/auth/data/firebase_auth_repo.dart';
import 'package:wegag/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:wegag/features/auth/presentation/cubits/auth_states.dart';
import 'package:wegag/features/auth/presentation/pages/auth_page.dart';
import 'package:wegag/features/auth/presentation/posts/presentstion/pages/home_page.dart';
import 'package:wegag/themes/light_mode.dart';

/*

APP - Root Level
---------------------------------------------------------------------------------------------------------------
Repositories: for the database
 - firebase

Bloc Providers: for state Management
 - auth
 - profile
 - post
 - search
 - theme

Check Auth State
 - unauthenticated -> auth page (login/ register)
 - authenticated -> homepage

*/

class MyApp extends StatelessWidget {
  final authRepo = FirebaseAuthRepo();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //providing the cubit to our App
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
      child: MaterialApp(
          theme: lightMode,
          debugShowCheckedModeBanner: false,
          home: BlocConsumer<AuthCubit, AuthStates>(
              builder: (context, authStates) {
            //unauthenticated => homepage
            if (authStates is Unauthenticated) {
              return const AuthPage();
            }

            //authenticated => homepage
            if (authStates is Authenticated) {
              return const HomePage();
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }, listener: (context, state) {
            if (state is AuthErrors) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          })),
    );
  }
}
