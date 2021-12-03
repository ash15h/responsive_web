import 'package:flutter/material.dart';
import 'package:responsive_web/helpers/responsive.dart';
import 'package:responsive_web/widgets/large_screen.dart';
import 'package:responsive_web/widgets/side_menu.dart';
import 'package:responsive_web/widgets/small_screen.dart';
import 'package:responsive_web/widgets/top_nav.dart';

class SiteLayout extends StatelessWidget {
  //const SiteLayout({Key? key}) : super(key: key);
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(
        child: SideMenu(),
      ),
      appBar: topNavigationBar(context, scaffoldKey),
      body: ResponsiveWidget(largeScreen: LargeScreen(),smallScreen: SmallScreen(),),
    );
  }
}
