import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../model/post_user_model.dart';
import '../../model/registor_model.dart';
import '../states/auth/register_states.dart';

class RegisterUser extends Cubit<RegisterStates> {
  DataUser? user;
  RegisterUser() : super(RegisterInitState()) {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
    avaterId = 0;
    modelU = PostUserModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      phone: passwordController.text,
      avaterId: avaterId,
    );
  }
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneController;
  var formKey = GlobalKey<FormState>();
  late int avaterId;
  late PostUserModel modelU;

  void register() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(RegisterLoadingState());
        modelU = PostUserModel(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
          phone: "+2${phoneController.text}",
          avaterId: avaterId,
        );
        Uri url =
        Uri.parse("https://route-movie-apis.vercel.app/auth/register");

        String requestBody = jsonEncode(modelU.toJson());

        final response = await http.post(
          url,
          headers: {"Content-Type": "application/json"},
          body: requestBody,
        );
        if (response.statusCode >= 200 && response.statusCode < 300) {
          emit(RegisterSuccessState());
        } else {
          print("Error : ${response.body}");
          emit(RegisterErrorState());
        }
      } catch (e) {
        print("Exception: $e");
        emit(RegisterErrorState());
      }
    }
  }
}
