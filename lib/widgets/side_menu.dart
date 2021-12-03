import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_web/constants/controllers.dart';
import 'package:responsive_web/constants/style.dart';
import 'package:responsive_web/helpers/responsive.dart';
import 'package:responsive_web/routing/routes.dart';
import 'package:responsive_web/widgets/custom_text.dart';
import 'package:responsive_web/widgets/side_menu_items.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: AppColors.light,
      child: ListView(
        children: [
          if(ResponsiveWidget.isSmallScreen(context))
           Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: _width / 48,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Image.asset("assets/icons/logo.png"),
                        ),
                        Flexible(
                          child: CustomText(
                            text: "Dash",
                            size: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.active,
                          ),
                        ),
                        SizedBox(
                          width: _width / 48,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Divider(
                      color: AppColors.lightGrey!.withOpacity(0.1),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: sideMenuItemRoutes
                          .map(
                            (itemName) => SideMenuItem(
                                itemName: itemName == authenticationPageRoute
                                    ? "Log out"
                                    : itemName,
                                onTap: () {
                                  if (itemName == authenticationPageRoute) {}
                                  if (!menuController.isActive(itemName)) {
                                    menuController.changeActiveItemTo(itemName);
                                    if (ResponsiveWidget.isSmallScreen(
                                        context)) {
                                      Get.back();
                                    }
                                  }
                                }),
                          )
                          .toList(),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
