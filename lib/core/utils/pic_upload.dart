import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

Future<String> picUpload(ByteData byteData) async {
  final bytes = byteData.buffer.asUint8List();
  final storageRef = FirebaseStorage.instance.ref().child('images/images/${DateTime.now().millisecondsSinceEpoch}.png');
  final uploadTask = storageRef.putData(bytes);
  var downloadURL;
  try {
    // Wait for the upload to complete.
    await uploadTask.whenComplete(() async {
      // Get the download URL of the uploaded file.
      downloadURL = await storageRef.getDownloadURL();
      print('File uploaded to Firebase Cloud Storage: $downloadURL');
    });
  } catch (error) {
    print('Upload error: $error');
    return '0';
  }
  return downloadURL;
}
