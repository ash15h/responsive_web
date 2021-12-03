import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_web/constants/controllers.dart';
import 'package:responsive_web/constants/style.dart';
import 'package:responsive_web/widgets/custom_text.dart';

class HorizontalMenuItems extends StatelessWidget {
  final String itemName;
  final Function onTap;

  const HorizontalMenuItems(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        onTap;
      },
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover("not hovering");
      },
      child: Obx(() => Container(
            color: menuController.isHovering(itemName)
                ? AppColors.lightGrey!.withOpacity(0.1)
                : Colors.transparent,
            child: Row(
              children: [
                Visibility(
                  visible: menuController.isHovering(itemName) ||
                      menuController.isActive(itemName),
                  child: Container(
                    width: 6,
                    height: 40,
                    color: AppColors.dark,
                  ),
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                ),
                SizedBox(
                  width: _width / 80,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: menuController.returnIconFor(itemName),
                ),
                !menuController.isActive(itemName)
                    ? Flexible(
                        child: CustomText(
                          text: itemName,
                          color: menuController.isHovering(itemName)
                              ? AppColors.dark
                              : AppColors.lightGrey,
                        ),
                      )
                    : Flexible(
                        child: CustomText(
                          text: itemName,
                          color: AppColors.dark,
                          size: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
          )),
    );
  }
}
