import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/features/common/widgets/custom_appbar_main.dart';
import 'package:store_app/features/common/widgets/custom_botttom_navigation.dart';
import 'package:store_app/features/notification/widgets/custom_notification_widget.dart';

import '../../../data/repository/notification_settings_repository.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool general = true;
  bool sound = true;
  bool vibrate = false;

  final String userId = "testUser";
  late final NotificationSettingsRepository repo;

  @override
  void initState() {
    super.initState();
    repo = context.read<NotificationSettingsRepository>();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final data = await repo.getSettings(userId);
    setState(() {
      general = data["general"] ?? true;
      sound = data["sound"] ?? true;
      vibrate = data["vibrate"] ?? false;
    });
  }

  void _updateSetting(String field, bool value) {
    repo.updateSetting(userId, field, value);
    setState(() {
      if (field == "general") general = value;
      if (field == "sound") sound = value;
      if (field == "vibrate") vibrate = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      appBar: CustomAppBarMain(title: "Notifications"),
      body: ListView(
        children: [
          CustomNotificationWidget(
            title: "General Notifications",
            value: general,
            onChanged: (v) => _updateSetting("general", v),
          ),
          CustomNotificationWidget(
            title: "Sound",
            value: sound,
            onChanged: (v) => _updateSetting("sound", v),
          ),
          CustomNotificationWidget(
            title: "Vibrate",
            value: vibrate,
            onChanged: (v) => _updateSetting("vibrate", v),
          ),
        ],
      ),
    );
  }
}
