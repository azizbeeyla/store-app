import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/app_color.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.isActive});

  final int isActive;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late int _currentIndex;

  final List<String> _routes = [
    Routes.homePage,
    Routes.searchPage,
    Routes.savedPage,
    Routes.cardPage,
    Routes.accountPage,
  ];

  @override
  void initState() {
    _currentIndex = widget.isActive;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() => _currentIndex = index);
        context.push(_routes[index]);
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.greyText,
      selectedLabelStyle:  TextStyle(
        fontSize: 12.sp,
        fontFamily: "GeneralSans",
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle:  TextStyle(
        fontSize: 12.sp,
        fontFamily: "GeneralSans",
        fontWeight: FontWeight.w500,
      ),
      items: [
        _navItem('assets/Home.svg', "Home", 0),
        _navItem('assets/Search.svg', "Search", 1),
        _navItem('assets/like_big.svg', "Saved", 2),
        _navItem('assets/Cart.svg', "Cart", 3),
        _navItem('assets/User.svg', "Account", 4),
      ],
    );
  }

  BottomNavigationBarItem _navItem(String icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          _currentIndex == index ? AppColors.primary : AppColors.grey,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
