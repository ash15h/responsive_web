import 'package:flutter/material.dart';
import 'package:responsive_web/helpers/responsive.dart';
import 'package:responsive_web/widgets/horizontal_menu_item.dart';
import 'package:responsive_web/widgets/vertical_menu_item.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;

  const SideMenuItem({Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isCustomScreen(context)
        ? VerticalMenuItems(itemName: itemName, onTap: onTap)
        : HorizontalMenuItems(itemName: itemName, onTap: onTap);
  }
}
