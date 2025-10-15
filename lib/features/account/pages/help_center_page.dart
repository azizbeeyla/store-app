import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/account/widgets/custom_help_widget.dart';
import 'package:store_app/features/common/widgets/custom_appbar_main.dart';
import 'package:store_app/features/common/widgets/custom_botttom_navigation.dart';
import '../../../core/utils/app_color.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBarMain(title: "Help Center"),
      body: Column(
        children: [
          Divider(
            color: AppColors.primary100,
          ),
          CustomHelpWidget(
onPressed: (){
  context.push(Routes.chat);
},
            svgIcon: 'assets/Headphones.svg',
            text: 'Customer Service',
          ),
          CustomHelpWidget(
            svgIcon: 'assets/Whatsapp.svg',
            text: 'Whatsapp',
          ),
          CustomHelpWidget(
            svgIcon: 'assets/Web.svg',
            text: 'Website',
          ),
          CustomHelpWidget(
            svgIcon: 'assets/Facebook.svg',
            text: 'Facebook',
          ),
          CustomHelpWidget(
            svgIcon: 'assets/Twitter.svg',
            text: 'Twitter',
          ),
          CustomHelpWidget(
            svgIcon: 'assets/Instagram.svg',
            text: 'Instagram',
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(isActive: 4),
    );
  }
}
