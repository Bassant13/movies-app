import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/class/app_rout.dart';
import 'package:movies_app/function/validate/name_validate.dart';
import 'package:movies_app/l10n/translation.dart';
import 'package:movies_app/ui/widgets/custom_buttons/custom_red_button.dart';
import 'package:movies_app/ui/widgets/custom_buttons/custom_yellow_button.dart';
import 'package:movies_app/ui/widgets/custom_text_form_field.dart';

import '../../core/app_assets/app_images/images.dart';
import '../../core/colors.dart';
import '../../function/validate/phone_validate.dart';

class EditProfileScreen extends StatefulWidget{
   EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  final currentUser = FirebaseAuth.instance.currentUser;

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();
  Color backgroundColor = AppColors.darkGray;
 int currentIndex =0;
  late String avatarName ;

  @override
  Widget build(BuildContext context) {
    final docUser = FirebaseFirestore.instance.collection("users").doc(currentUser?.email);
    double screenHeight = MediaQuery.sizeOf(context).height;
   return SafeArea(
     child: Scaffold(
       appBar:  AppBar(
         centerTitle: true,
         title:  Text(
           getTranslations(context).edit_profile
         ),
       ),
       body: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 30),
           child: Form(
             key: _formKey,
    child:  Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
    StreamBuilder<DocumentSnapshot>(
    stream: FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser?.email)
        .snapshots(),
               builder: (context,snapshot){
                 if(snapshot.hasData){
                   final userData = snapshot.data!.data() as Map<String,dynamic>;
                   avatarName = userData['avatar'];
                   return Column(
                   children: [
                     InkWell(
                         onTap: (){
                           showModalBottomSheet(
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(16)
                             ),
                             backgroundColor: Theme.of(context).indicatorColor,
                             context: context,
                             useSafeArea: false,
                             builder: (context){
                               return SizedBox(
                                 height: 389 ,
                                 width: 398,
                                 child: Card(
                                   color: AppColors.darkGray,
                                   child: Padding(
                                       padding: EdgeInsets.all(16),
                                       child: Expanded(
                                         child: GridView.builder(
                                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                 crossAxisCount: 3
                                             ),
                                             itemBuilder: (context,index){
                                               currentIndex = index;
                                               return Expanded(
                                                   child: InkWell(
                                                     onTap: (){
                                                       setState(() {
                                                        // backgroundColor = AppColors.lowOpacityYellow;
                                                         avatarName = AppImages.avatars[currentIndex];

                                                       });
                                                     },
                                                     child: Card(
                                                       color: backgroundColor,
                                                       shape: RoundedRectangleBorder(
                                                           borderRadius: BorderRadius.circular(20),
                                                           side: BorderSide(
                                                             width: 1,
                                                             color: AppColors.yellow,
                                                           )
                                                       ),
                                                       child: Center(child: Image.asset(AppImages.avatars[currentIndex])),
                                                     ),
                                                   )
                                               );
                                             }
                                         ),
                                       )
                                   ),
                                 ),
                               );
                             },
                           );
                         },
                         child: Center(
                             child: Image.asset(
                               avatarName,

                             )
                         )),
                     SizedBox(height: 30,),
                     CustomTextFormField(
                       text: userData['name'],
                       hint: getTranslations(context).name,
                       controller: nameController,
                       validator: (val) =>
                           nameValidate(nameController.text),
                       iconName: Icons.person,
                     ),
                     const SizedBox(height: 20,),
                     CustomTextFormField(
                       text:userData['phone'] ,
                       hint: getTranslations(context).phone_number,
                       controller: phoneNumberController,
                       validator: (val) =>
                           phoneValidate(phoneNumberController.text),
                       iconName: Icons.phone,
                     ),

                   ],
                 );
                 }else if(snapshot.hasError){
                   return Center(child: Text(snapshot.error.toString()),);
                 }return Center(child: CircularProgressIndicator(),);
               }
                 ),
                 Column(
                   children: [
                     const SizedBox(height: 25,),
                     TextButton(
                       onPressed: () {
                         Navigator.pushNamed(context, AppRouts.restPass);
                       },
                       child: Text(
                         getTranslations(context).reset_password,
                         style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.normal),
                       ),
                     ),
                     SizedBox(height: screenHeight/6,),
                     CustomRedButton(
                       onClick: (){
                          docUser.delete();
                          Navigator.pushNamed(context, AppRouts.login);
                       },
                       text: getTranslations(context).delete_account,
                     ),
                     const SizedBox(height: 20,),
                     CustomYellowButton(
                       onClick: (){
                         if(_formKey.currentState!.validate()){
                         docUser.update({
                           'avatar': avatarName,
                           'name': nameController.text,
                           'phone': phoneNumberController.text
                         });
                          }
                       },
                       text: getTranslations(context).update_data,
                     )
                   ],
                 )
               ],
             )
           ),
         ),
       ),
     ),
   );
  }
}
