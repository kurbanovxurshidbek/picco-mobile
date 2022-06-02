import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

import 'log_service.dart';

class StoreService {
  static final DateTime now = DateTime.now();
  static final String today = ('${now.month.toString()}-${now.day.toString()}');
  static final String storageId = '$today-${now.millisecondsSinceEpoch}.jpg';

  static var percentageStream = StreamController<double>();
  static final metadata = SettableMetadata(contentType: "image/jpeg");

  static final _storage = FirebaseStorage.instance.ref();
  static const folderImage = "image";

  // static Future<List<String>?> uploadFiles(List<File> _images) async {
  //   try {
  //     var imageUrls = await Future.wait(
  //       _images.map((_image) => uploadFile(_image)),
  //     );
  //
  //     return imageUrls;
  //   } catch (e) {
  //     Log.e(e.toString());
  //     return null;
  //   }
  // }

  static UploadTask? uploadFile(File _image) {
    try {
      final storageReference =
      _storage.child(folderImage).child(today).child(storageId);

      return storageReference.putFile(_image, metadata);
    } on FirebaseException {
      return null;
    }
  }
}
