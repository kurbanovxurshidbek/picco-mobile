import 'package:picco/models/message_model.dart';
import 'package:picco/services/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'local_widgets/build_messages.dart';
import 'local_widgets/empty_messages.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Text(
                LocalizationKey.str_messages_page_header.tr(context),
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 30.h),
              (messages.isEmpty)
                  ? const EmptyMessages()
                  : const BuildMessages(),
            ],
          ),
        ),
      ),
    );
  }
}
