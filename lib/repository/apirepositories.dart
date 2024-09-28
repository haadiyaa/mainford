import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:main_ford/resources/secrets.dart';  // Adjust this import as necessary

class ApiRepositories {
  Future<http.Response> registeRequest({
    required File file,
    required String filename,
    required String name,
    required String phone,
    required String email,
    required String dob,
    required String refer,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("${Secrets.baseUrl}${Secrets.registerUser}"),
    );
    
    // Map<String, String> headers = {"Content-type": "multipart/form-data"};
    
    request.files.add(
      http.MultipartFile(
        'screenshot',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: filename,
        contentType: MediaType('image', 'png'),
      ),
    );
    
    // request.headers.addAll(headers);
    
    request.fields.addAll({
      "name": name,
      "email": email,
      "phone": phone,
      "dob": dob,
      "referredBy": refer,
    });
    
    print("Sending request...");
    
    var streamedResponse = await request.send();
    
    var response = await http.Response.fromStream(streamedResponse);
    
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    return response;
  }
}
