import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/account/widgets/custom_row_account.dart';
import 'package:store_app/features/common/widgets/custom_appbar_main.dart';
import 'package:store_app/features/common/widgets/custom_botttom_navigation.dart';
import '../../../core/utils/app_color.dart';
import '../widgets/logout_dialog.dart';
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBarMain(title: "Account"),
      body: Column(
        children: [
          CustomRowAccount(
            onPressed: (){

              context.push(Routes.orderPage);
            },
            svgICon: 'assets/Box.svg',
            title: 'My Orders',
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: 390.w,
            height: 8.h,
            decoration: BoxDecoration(color: AppColors.grey),
          ),

          CustomRowAccount(
            onPressed: (){
              context.push(Routes.myDetail);
            },
            svgICon: 'assets/Details.svg',
            title: "My Details",
            showDivider: false,
          ),
          CustomRowAccount(
            onPressed: (){
              context.push(Routes.address);
            },
            svgICon: 'assets/Address.svg',
            title: "Address Book",
          ),
          CustomRowAccount(
            svgICon: 'assets/Card-duotone.svg',
            title: "Payment Methods",
            onPressed: () {
              context.push(Routes.paymentCard);
            },
          ),
          GestureDetector(
            onTap: () {
              context.push(Routes.notifSettings);
            },
            child: CustomRowAccount(
              svgICon: 'assets/Bell.svg',
              title: "Notifications",
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Container(
            width: 390.w,
            height: 8.h,
            decoration: BoxDecoration(color: AppColors.grey),
          ),
          CustomRowAccount(
            onPressed: (){
              context.push(Routes.faqPage);
            },
            svgICon: "assets/Question.svg",
            title: "FAQs",
            showDivider: false,
          ),
          CustomRowAccount(
            onPressed: () {
              context.push(Routes.helpCenter);
            },

            svgICon: "assets/Headphones.svg",
            title: "Help Center",

          ),
          SizedBox(
            height: 25.h,
          ),
          Container(
            width: 390.w,
            height: 8.h,
            decoration: BoxDecoration(color: AppColors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 24, right: 275),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => LogoutDialog(),
                );
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/Logout.svg",
                  ),
                  SizedBox(
                    width: 19.w,
                  ),
                  Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w400,
                      fontFamily: "GeneralSans",
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(isActive: 4),
    );
  }
}

