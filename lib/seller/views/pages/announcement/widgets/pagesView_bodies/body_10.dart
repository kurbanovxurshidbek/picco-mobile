import 'package:picco/seller/views/pages/announcement/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TenthBody extends StatelessWidget {
  const TenthBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider =
        context.select((AnnouncementProvider provider) => provider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
      child: TextField(
        controller: provider.titleController,
        focusNode: provider.titleFocus,
        keyboardType: TextInputType.multiline,
        maxLength: 50,
        maxLines: null,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade300,
          contentPadding: const EdgeInsets.fromLTRB(15, 5, 15, 35),
          hintText: 'Загаловок',
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Colors.black54),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Colors.black54),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
