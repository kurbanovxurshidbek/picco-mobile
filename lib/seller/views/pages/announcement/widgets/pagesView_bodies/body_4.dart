import 'package:picco/seller/views/pages/announcement/provider.dart';
import 'package:picco/seller/views/pages/announcement/widgets/titles_and_buttons/save_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FourthBody extends StatelessWidget {
  const FourthBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider =
        context.select((AnnouncementProvider provider) => provider);

    return Stack(
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
            onTap: (){
              // provider.updateHeight(true);
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,

                  builder: (BuildContext context) {

                    return DraggableScrollableSheet(
                        initialChildSize: 0.96,
                        minChildSize: 0.5,
                        maxChildSize: 0.96,
                        builder: (_, controller){
                          return Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20.0)
                              ),
                            ),
                            child: ListView(
                              padding: const EdgeInsets.all(10.0),
                              physics: const BouncingScrollPhysics(),
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.arrow_back, size: 27),
                                    ),
                                    const SizedBox(width: 17),
                                    const Text(
                                      'Введите аддрес',
                                      style: TextStyle(color: Colors.black, fontSize: 17),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30.0),
                                SizedBox(
                                  width: 1.sw,
                                  child: DropdownButtonFormField<String>(
                                    icon: const Icon(Icons.keyboard_arrow_down, size: 30),
                                    iconEnabledColor: Colors.black54,
                                    iconDisabledColor: Colors.grey,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(10.0, 14.0, 10.0, 14.0),
                                      labelText: 'Область',
                                      labelStyle: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(color: Colors.grey)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(color: Colors.grey)),
                                    ),
                                    value: provider.selectedOption,
                                    items: provider.options
                                        .map(
                                          (e) => DropdownMenuItem<String>(
                                        value: e,
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                        .toList(),
                                    onChanged: (option) {
                                      provider.chooseOption(option!);
                                    },
                                  ),
                                ),
                                const SizedBox(height: 15.0),
                                SizedBox(
                                  width: 1.sw,
                                  child: DropdownButtonFormField<String>(
                                    icon: const Icon(Icons.keyboard_arrow_down, size: 30),
                                    iconEnabledColor: Colors.black54,
                                    iconDisabledColor: Colors.grey,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(10.0, 14.0, 10.0, 14.0),
                                      labelText: 'Район/Город',
                                      labelStyle: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(color: Colors.grey)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(color: Colors.grey)),
                                    ),
                                    items: provider.options
                                        .map(
                                          (e) => DropdownMenuItem<String>(
                                        value: e,
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                        .toList(),
                                    onChanged: (option) {
                                      provider.chooseOption(option!);
                                    },
                                  ),
                                ),
                                const SizedBox(height: 15.0),
                                SizedBox(
                                  width: 1.sw,
                                  child: DropdownButtonFormField<String>(
                                    icon: const Icon(Icons.keyboard_arrow_down, size: 30),
                                    iconEnabledColor: Colors.black54,
                                    iconDisabledColor: Colors.grey,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(10.0, 14.0, 10.0, 14.0),
                                      labelText: 'Улица',
                                      labelStyle: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(color: Colors.grey)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(color: Colors.grey)),
                                    ),
                                    items: provider.options
                                        .map(
                                          (e) => DropdownMenuItem<String>(
                                        value: e,
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                        .toList(),
                                    onChanged: (option) {
                                      provider.chooseOption(option!);
                                    },
                                  ),
                                ),
                                const SizedBox(height: 30.0),
                                Divider(color: Colors.grey.shade400, thickness: 2),
                                const SizedBox(height: 20.0),
                                const Text(
                                  'Точное место',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                const Text(
                                  'Вы можете показать, где именно находится жилье',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(20.0),
                                      ),
                                      border: Border.all(color: Colors.grey.shade400, width: 3)),
                                  child: const Image(
                                    image: AssetImage(
                                      'assets/images/map_view.png',
                                    ),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                SaveButton(provider: provider)
                              ],
                            ),
                          );
                        }
                    );
                  }
              );
            },
          ),
        ),
      ],
    );
  }
}
