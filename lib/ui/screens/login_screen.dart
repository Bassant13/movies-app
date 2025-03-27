import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth/login.dart';
import '../../bloc/states/auth/login_states.dart';
import '../../core/app_assets/app_images/images.dart';
import '../../core/class/app_rout.dart';
import '../../core/class/firebase_manager.dart';
import '../../core/colors.dart';
import '../../customs/button.dart';
import '../../customs/input_field.dart';
import '../../customs/lang_mode_btn.dart';
import '../../function/validate/email_validate.dart';
import '../../function/validate/pass_validate.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool langMode = false;


  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogInUser>(
      create: (context) => LogInUser(),
      child: Scaffold(
        body: BlocConsumer<LogInUser, LogInStates>(listener: (context, state) {
          if (state is LogInErrorState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRouts.home, (Route<dynamic> route) => false);
          }
          if (state is LogInSuccessState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRouts.home, (Route<dynamic> route) => false);
          }
        }, builder: (context, state) {
          var bloc = BlocProvider.of<LogInUser>(context);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Form(
                key: bloc.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      AppImages.logo,
                      height: 250,
                    ),
                    InputField(
                      controller: bloc.emailController,
                      validate: (val) => emailValidate(val),

                      lable: "email".tr(),
                      prefixIcon: Image.asset(AppImages.emailIcon),
                      isPassword: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22, bottom: 17),
                      child: InputField(
                        controller: bloc.passwordController,
                        validate: (val) => passValidate(val, 8, 25),
                        lable: "password".tr(),
                        prefixIcon: Image.asset(AppImages.passwordIcon),
                        isPassword: true,
                        suffixIcon: Icon(
                          Icons.visibility_off_rounded,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRouts.forgetPass);
                          },
                          child: Text(
                            "Forget Password".tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                fontSize: 15 , color: AppColors.yellow),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 33, bottom: 22),
                      child: ElevatedButton(
                        onPressed: () {
                          bloc.logIn();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Text(
                            "login_btn".tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppColors.darkGray),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "don’t_have_account".tr(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 14),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRouts.register);
                          },
                          child: Text(
                            "create_one".tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                fontSize: 14, color: AppColors.yellow),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5,
                          width: 120,
                          child: Divider(
                            endIndent: 10,
                            thickness: 2,
                            height: 10,
                            color: AppColors.yellow,
                          ),
                        ),
                        Text(
                          "or".tr(),
                          style: TextStyle(color: AppColors.yellow),
                        ),
                        SizedBox(
                          height: 5,
                          width: 120,
                          child: Divider(
                            indent: 10,
                            thickness: 2,
                            color:AppColors.yellow,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    CustomButton(
                      ontap: () async {
                        try {
                          UserCredential userCredential = await FirebaseManager.signInWithGoogle();
                          if (userCredential.user != null) {
                            print("Google Sign-In successful: ${userCredential.user!.email}");
                            Navigator.pushReplacementNamed(context, AppRouts.home);
                          } else {
                            print("Google Sign-In failed");
                          }
                        }  catch (e) {
                          print("Error during Google Sign-In: $e");
                        }
                      },
                      widget: InkWell(
                        onTap: () async {
                          try {
                            UserCredential userCredential = await FirebaseManager.signInWithGoogle();
                            if (userCredential.user != null) {
                              Navigator.pushReplacementNamed(context, AppRouts.home);
                            } else {
                              print("Google Sign-In failed");
                            }
                          } catch (e) {
                            print("Error during Google Sign-In: $e");
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.googleImage),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Login With Google".tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: AppColors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              langMode = !langMode;
                              if (langMode == false) {
                                context.setLocale(Locale("en"));
                              } else {
                                context.setLocale(Locale("ar"));
                              }
                              setState(() {});
                            },
                            child: LangModeBtn(mode: langMode)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

