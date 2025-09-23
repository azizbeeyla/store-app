import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/features/common/widgets/custom_appbar_main.dart';
import 'package:store_app/features/common/widgets/custom_botttom_navigation.dart';
import 'package:store_app/features/notification/managers/notification_cubit.dart';
import 'package:store_app/features/notification/managers/notification_state.dart';
import 'package:store_app/features/notification/widgets/notification_empty_widget.dart';
import 'package:store_app/features/notification/widgets/notification_item.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(repository: context.read()),
      child: Scaffold(
        backgroundColor: AppColors.white,
        extendBody: true,
        appBar: const CustomAppBarMain(title: "Notifications"),
        body: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state.loading!) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.errorMessage != null) {
              return Center(child: Text("Xato: ${state.errorMessage}"));
            }

            if (state.notifications == null || state.notifications!.isEmpty) {
              return const NotificationEmptyWidget();
            }


            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.notifications!.length,
              itemBuilder: (context, index) {
                final item = state.notifications![index];

                return NotificationItem(
                  day: item.date != null ? item.timeAgo : null,
                  svgIcon: item.icon,
                  text: item.title,
                  description: item.content,
                );
              },
            );
          },
        ),
        bottomNavigationBar: CustomBottomNavigationBar(isActive: 0),
      ),
    );
  }
}
