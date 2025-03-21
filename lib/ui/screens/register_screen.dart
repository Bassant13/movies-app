import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth/register.dart';
import '../../bloc/states/auth/register_states.dart';
import '../../core/app_assets/app_images/images.dart';
import '../../core/colors.dart';
import '../../customs/input_field.dart';
import '../../customs/lang_mode_btn.dart';
import '../../function/validate/email_validate.dart';
import '../../function/validate/name_validate.dart';
import '../../function/validate/pass_validate.dart';
import '../../function/validate/phone_validate.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int avaterId = 0;
  final PageController _pageController =
  PageController(initialPage: 4, viewportFraction: .3);
  bool langMode = false;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        avaterId = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterUser>(
      create: (context) => RegisterUser(),
      child: BlocConsumer<RegisterUser, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                  title: Text("loading".tr()),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  )),
            );
          }
          if (state is RegisterErrorState) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  spacing: 10,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Account successfully created",
                      style: TextStyle(color: AppColors.primary),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: AppColors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text("login_btn".tr()),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          if (state is RegisterSuccessState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("success".tr()),
                content: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);

                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("login_btn".tr()),
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          var bloc = BlocProvider.of<RegisterUser>(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("register".tr()),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                child: Form(
                  key: bloc.formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 94,
                          child: PageView.builder(
                              controller: _pageController,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                bloc.avaterId = avaterId;
                                // print(
                                //     "---------avId from screen ${bloc.avaterId}");
                                return Image.asset(AppImages.avatars[index]);
                              },
                              itemCount: AppImages.avatars.length),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 12),
                          child: Text(
                            "avatar".tr(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        InputField(
                          controller: bloc.nameController,
                          validate: (val) =>
                              nameValidate(bloc.nameController.text),
                          lable: "name".tr(),
                          prefixIcon: Image.asset(AppImages.nameIcon),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        InputField(
                          controller: bloc.emailController,
                          validate: (val) =>
                              emailValidate(bloc.emailController.text),
                          lable: "email".tr(),
                          prefixIcon: Image.asset(AppImages.emailIcon),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        InputField(
                          controller: bloc.passwordController,
                          validate: (val) =>
                              passValidate(bloc.passwordController.text, 8, 25),
                          lable: "password".tr(),
                          isPassword: true,
                          prefixIcon: Image.asset(AppImages.passwordIcon),
                          suffixIcon: Icon(
                            Icons.visibility_off_rounded,
                            color: AppColors.text,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        InputField(
                          controller: bloc.confirmPasswordController,
                          validate: (val) => passValidate(
                              bloc.confirmPasswordController.text, 8, 25,
                              isRePass: true,
                              pass: bloc.passwordController.text),
                          lable: "confirm_pass".tr(),
                          isPassword: true,
                          prefixIcon: Image.asset(AppImages.passwordIcon),
                          suffixIcon: Icon(
                            Icons.visibility_off_rounded,
                            color: AppColors.text,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        InputField(
                          controller: bloc.phoneController,
                          validate: (val) =>
                              phoneValidate(bloc.phoneController.text),
                          lable: "phone".tr(),
                          prefixIcon: Image.asset(AppImages.phoneIcon),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              bloc.register();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                "create_account_btn".tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: AppColors.primary),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 17, bottom: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "already_have_account".tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 14),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, LoginScreen.routeName);
                                },
                                child: Text(
                                  "login_btn".tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                      fontSize: 14,
                                      color: AppColors.button),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                              child: LangModeBtn(
                                mode: langMode,
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

