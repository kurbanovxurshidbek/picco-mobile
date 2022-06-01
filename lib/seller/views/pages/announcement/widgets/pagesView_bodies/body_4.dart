import 'package:picco/seller/views/pages/announcement/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FourthBody extends StatelessWidget {
  const FourthBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider =
        context.select((AnnouncementProvider provider) => provider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
            ),
            child: const Image(
              image: AssetImage(
                'assets/images/map_view.png',
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: 20.0,
            left: 30.0,
            right: 30.0,
            height: 60,
            child: TextField(
              controller: provider.addressController,
              focusNode: provider.addressFocus,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              style: const TextStyle(fontSize: 20, color: Colors.black87),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                labelText: 'Введите аддрес',
                floatingLabelAlignment: FloatingLabelAlignment.center,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                floatingLabelStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                labelStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black87,
                ),
                // suffixIcon: viewModel.isNotEmpty
                //     ? IconButton(
                //     splashRadius: 1,
                //     icon: const Icon(CupertinoIcons.clear,
                //         size: 18, color: Colors.white),
                //     onPressed: () {
                //       viewModel.clear();
                //     })
                //     : const SizedBox.shrink(),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                    color: Colors.black54,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                    color: Colors.black54,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                    color: Colors.black54,
                    width: 2,
                  ),
                ),
              ),
              onChanged: (String txt) {},
              onSubmitted: (String account) {},
            ),
          ),
        ],
      ),
    );
  }
}
