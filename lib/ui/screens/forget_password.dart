import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../core/app_assets/app_images/images.dart';
import '../../core/colors.dart';
import '../../customs/input_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("forget_password_bar".tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppImages.forgetImage),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: InputField(
                lable: "email".tr(),
                prefixIcon: Image.asset(AppImages.emailIcon),
                validate: () {},
              ),
            ),
            ElevatedButton(
                onPressed: () {
                 // Navigator.pushNamed(context, AppRouts.restPass);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    "verify_email_btn".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.darkGray),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
