import 'package:picco/services/localization_service.dart';
import 'package:flutter/material.dart';

class EmptyMessages extends StatelessWidget {
  const EmptyMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            LocalizationKey.str_empty_messages_page.tr(context),
            style: const TextStyle(fontSize: 17, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
