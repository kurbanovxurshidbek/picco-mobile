import 'package:picco/seller/announcement/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TenthBody extends StatelessWidget {
  const TenthBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AnnouncementProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<AnnouncementProvider>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
      child: Column(
        children: [
          Expanded(
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
                hintStyle:
                const TextStyle(color: Colors.grey, fontSize: 18),

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
          ),
          const Divider(
            color: Color(0xff7842D0),
            thickness: 2,
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  child: const Text(
                    'Назад',
                    style: TextStyle(fontSize: 18),
                  ),
                  color: Colors.transparent,
                  elevation: 0.0,
                  onPressed: () {
                    provider.navigate(8);
                  },
                ),
                MaterialButton(
                  child: const Text(
                    'Далее',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  color: const Color(0xff7842D0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  onPressed: () {
                    provider.navigate(10);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

