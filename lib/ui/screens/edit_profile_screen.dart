import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/l10n/translation.dart';
import 'package:movies_app/ui/widgets/custom_buttons/custom_red_button.dart';
import 'package:movies_app/ui/widgets/custom_buttons/custom_yellow_button.dart';
import 'package:movies_app/ui/widgets/custom_text_form_field.dart';

class EditProfileScreen extends StatelessWidget{
  static const String routeName = 'edit profile';
   EditProfileScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               InkWell(onTap: (){},child: Center(
                   child: SvgPicture.asset('assets/images/default_avatar.svg',/*width: 150,height: 150,*/))),
               SizedBox(height: 30,),
               CustomTextFormField(
                 hint: getTranslations(context).name,
                 controller: nameController,
                 iconName: Icons.person,
               ),
               const SizedBox(height: 20,),
               CustomTextFormField(
                 hint: getTranslations(context).phone_number,
                 controller: phoneNumberController,
                 iconName: Icons.phone,
               ),
               const SizedBox(height: 25,),
               TextButton(
                 onPressed: () {  },
                 child: Text(
                   getTranslations(context).reset_password,
                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.normal),
                 ),
               ),
                SizedBox(height: screenHeight/6,),
               CustomRedButton(
                 onClick: (){},
                 text: getTranslations(context).delete_account,
               ),
               const SizedBox(height: 20,),
               CustomYellowButton(
                 onClick: (){},
                 text: getTranslations(context).update_data,
               )
             ],
           ),
         ),
       ),
     ),
   );
  }

}
