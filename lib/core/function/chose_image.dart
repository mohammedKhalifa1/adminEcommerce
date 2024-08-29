import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

choseImage() async {
  final XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 90);
  return file != null ? File(file.path) : null;
}

choseFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.custom,
    allowedExtensions: ['jpg', 'pdf', 'mp3', 'png', 'mp4'],
  );
  return result != null ? File(result.files.single.path!) : null;
}






// Future<Either<StatusRequest, Map>> addRequestWithImageOne(
//       url, data, File? image,
//       [String? namerequest]) async {
//     if (namerequest == null) {
//       namerequest = "files";
//     }

//     var uri = Uri.parse(url);
//     var request = http.MultipartRequest("POST", uri);
//     request.headers.addAll(_myheaders);

//     if (image != null) {
//       var length = await image.length();
//       var stream = http.ByteStream(image.openRead());
//       stream.cast();
//       var multipartFile = http.MultipartFile(namerequest, stream, length,
//           filename: basename(image.path));
//       request.files.add(multipartFile);
//     }

//     // add Data to request
//     data.forEach((key, value) {
//       request.fields[key] = value;
//     });
//     // add Data to request
//     // Send Request
//     var myrequest = await request.send();
//     // For get Response Body
//     var response = await http.Response.fromStream(myrequest);
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       print(response.body);
//       Map responsebody = jsonDecode(response.body);
//       return Right(responsebody);
//     } else {
//       return const Left(StatusRequest.serverfailure);
//     }
//   }