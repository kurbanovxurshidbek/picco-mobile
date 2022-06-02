import 'package:picco/seller/views/pages/announcement/provider.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  AnnouncementProvider provider;

  SaveButton({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: MaterialButton(
        minWidth: double.infinity,
        height: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: const Color(0xff7842D0),
        splashColor: Colors.white54,
        textColor: Colors.white,
        child: const Text(
          'Сохранить',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          provider.updateButtonDisability(false);
          Navigator.pop(context);
        },
      ),
    );
  }
}
