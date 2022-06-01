import 'package:picco/customer/models/all_models.dart';
import 'package:flutter/material.dart';

class MainListTile extends StatelessWidget {
  final ProfileModel item;

  const MainListTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => item.id));
      },
      leading: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(item.icon, color: Colors.black),
      ),
      title: Text(item.text),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        size: 17,
        color: Colors.black,
      ),
    );
  }
}
