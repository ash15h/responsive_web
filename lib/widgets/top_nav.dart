import 'package:flutter/material.dart';
import 'package:responsive_web/constants/style.dart';
import 'package:responsive_web/helpers/responsive.dart';
import 'package:responsive_web/widgets/custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      elevation: 0,
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 14),
                  child: Image.asset(
                    "assets/icons/logo.png",
                    width: 28,
                  ),
                )
              ],
            )
          : IconButton(
              onPressed: () {
                key.currentState!.openDrawer();
              },
              icon: const Icon(Icons.menu)),
      title: Row(
        children: [
          const Visibility(
              child: CustomText(
            text: "Dash",
            size: 20,
            color: Color(0xFFA4A6B3),
            fontWeight: FontWeight.bold,
          )),
          Expanded(child: Container()),
          IconButton(
            icon: const Icon(Icons.settings),
            color: AppColors.dark.withOpacity(0.7),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                color: AppColors.dark.withOpacity(0.7),
                onPressed: () {},
              ),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color(0xFF3C19C0),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.light,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 1,
            height: 22,
            color: AppColors.lightGrey,

          ),
          const SizedBox(width: 24,),
          CustomText(text:"Lorem Ipsum",color: AppColors.lightGrey,),
          const SizedBox(width: 16,),
          Container(
            decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
              child: CircleAvatar(backgroundColor:AppColors.light,child: Icon(Icons.person_outline,color: AppColors.dark,),),
            ),
          ),
        ],
      ),
      iconTheme: IconThemeData(color: AppColors.dark),
      backgroundColor: Colors.transparent,
    );
