
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/app_assets/app_icons/app_icons.dart';
import 'package:movies_app/core/colors.dart';
import 'package:movies_app/l10n/translation.dart';
import 'package:movies_app/ui/screens/edit_profile_screen.dart';
import 'package:movies_app/ui/widgets/custom_buttons/custom_yellow_button.dart';
import '../../../../widgets/custom_buttons/custom_red_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileTab extends StatelessWidget{
  static const String routeName = 'profile tab';
  ProfileTab({super.key});

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
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                        child: Image.asset('assets/images/default.png'),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          'John Safwat',
                                          style: Theme.of(context).textTheme.labelSmall,
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
                                      Navigator.pushNamed(context, EditProfileScreen.routeName);
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
                                          flipX: true,
                                            child: SvgPicture.asset(AppIcons.icExit)
                                        ),
                                      ),
                                      onClick: (){},
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
                                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal),
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
                                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal),
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
                  )
                ],
              ),
            ),
            Expanded(child: Text(''),flex: 1,)
          ],
        ),
      ),
    );
  }

}
