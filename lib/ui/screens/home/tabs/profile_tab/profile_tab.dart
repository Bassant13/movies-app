
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/app_assets/app_images/images.dart';
import 'package:movies_app/core/class/app_rout.dart';
import 'package:movies_app/core/colors.dart';
import 'package:movies_app/l10n/translation.dart';
import 'package:movies_app/ui/widgets/custom_buttons/custom_yellow_button.dart';
import '../../../../../core/app_assets/app_icons/app_icons.dart';
import '../../../../widgets/custom_buttons/custom_red_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileTab extends StatefulWidget{
  ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final currentUser = FirebaseAuth.instance.currentUser;
  late ThemeData themeData;

  late AppLocalizations translation;

  late double screenHeight;

  late BuildContext buildContext;

  @override
  Widget build(BuildContext context) {
     screenHeight = MediaQuery.sizeOf(context).height;
     themeData = Theme.of(context);
     translation = getTranslations(context);
     buildContext = context;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                  ),
                      Padding(
                            padding: EdgeInsets.fromLTRB(16,30,16,0),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: StreamBuilder<DocumentSnapshot>(
                                            stream: FirebaseFirestore.instance
                                                .collection("users")
                                                .doc(currentUser?.email)
                                                .snapshots(),
                                            builder: (context,snapshot){
                                              if(snapshot.hasData){
                                                final userData = snapshot.data!.data() as Map<String,dynamic>;
                                                return Column(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Image.asset(userData['avatar']),
                                            ),
                                            Expanded(
                                                flex: 2,
                                                child: Text(
                                                  userData['name'],
                                                  style: Theme.of(context).textTheme.labelSmall,
                                                )
                                            )
                                          ],
                                        );
                          }else if(snapshot.hasError){
                            return Center(child: Text(snapshot.error.toString()),);
                          }return Center(child: CircularProgressIndicator(),);
                        }
                  )
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Text(
                                                  '12',
                                                  style: Theme.of(context).textTheme.labelLarge,
                                                )
                                            ),
                                            Expanded(
                                                child: Text(
                                                  getTranslations(context).watch_list,
                                                  style: Theme.of(context).textTheme.labelMedium,
                                                )
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Text(
                                                  '10',
                                                  style: Theme.of(context).textTheme.labelLarge,
                                                )
                                            ),
                                            Expanded(
                                                child: Text(
                                                  getTranslations(context).history,
                                                  style: Theme.of(context).textTheme.labelMedium,
                                                )
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: CustomYellowButton(
                                              text: getTranslations(context).edit_profile,
                                              onClick: (){
                                                Navigator.pushNamed(context, AppRouts.editProfile);
                                              },
                                            )
                                        ),
                                        const SizedBox(width: 10,),
                                        Expanded(
                                            flex: 1,
                                            child: CustomRedButton(
                                              text: getTranslations(context).exit,
                                              widget: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: Transform.flip(
                                                  // flipX: true,
                                                    child: SvgPicture.asset(AppIcons.icExit)
                                                ),
                                              ),
                                              onClick: (){
                                                FirebaseAuth.instance.signOut();
                                              },
                                            )
                                        )
                                      ],
                                    )
                                ),
                                Expanded(
                                  flex: 1,
                                  child: DefaultTabController(
                                    length: 2,
                                    child:  TabBar(
                                      dividerHeight: double.nan,
                                      indicatorColor: AppColors.yellow,
                                      indicatorWeight: 3,
                                      tabs: [
                                        Tab(
                                          child: Column(
                                            children: [
                                              Expanded(
                                                  flex: 2,
                                                  child: SvgPicture.asset(AppIcons.icWatchList)
                                              ),
                                              Expanded(
                                                  flex: 4,
                                                  child: Text(
                                                    getTranslations(context).watch_list,
                                                    style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.normal),
                                                  )
                                              )
                                            ],
                                          ),
                                        ),
                                        Tab(
                                          child: Column(
                                            children: [
                                              Expanded(
                                                  flex: 2,
                                                  child: SvgPicture.asset(AppIcons.icHistory,)
                                              ),
                                              Expanded(
                                                  flex: 4,
                                                  child: Text(
                                                    getTranslations(context).history,
                                                    style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.normal),
                                                  )
                                              )
                                            ],
                                          ),
                                        )
                                      ],

                                    ),

                                  ),
                                )
                              ],
                            ),
                          ),
                  //       }else if(snapshot.hasError){
                  //         return Center(child: Text(snapshot.error.toString()),);
                  //       }return Center(child: CircularProgressIndicator(),);
                  //     }
                  // )

                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Image.asset(AppImages.empty),
              ),
            )
          ],
        ),
      ),
    );
  }
}
