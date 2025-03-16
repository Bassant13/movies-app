import 'package:flutter/material.dart';

class BrowseTab extends StatefulWidget{
  static const String routeName = 'browse';

  const BrowseTab({super.key});
  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
         body: Column(
           children: [

           ],
         ),
        )
    );
  }
}