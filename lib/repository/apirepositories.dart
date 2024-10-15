import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:main_ford/resources/secrets.dart';

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

    request.files.add(
      http.MultipartFile(
        'screenshot',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: filename,
        contentType: MediaType('image', 'png'),
      ),
    );

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

  Future<http.Response> login(
      {required String email, required String password}) async {
    final body = {
      "email": email,
      "password": password,
    };
    final response = await http.post(
      Uri.parse('https://main-ford.vercel.app/api/users/login'),
      body: jsonEncode(body),
      headers: {"Content-Type": "application/json"},
    );
    return response;
  }

  Future<http.Response> getUser({required String token}) async {
    final headers = {
      "Authorization": "Bearer $token",
    };
    final response = await http.get(
        Uri.parse('${Secrets.baseUrl}${Secrets.getUser}'),
        headers: headers);
    print('response-getuser : ${response.body}');
    return response;
  }

  Future<http.Response> checkStatus({required String token}) async {
    final headers = {
      "Authorization": "Bearer $token",
    };
    final response = await http.get(
      Uri.parse('${Secrets.baseUrl}${Secrets.checkAdminApprove}'),
      headers: headers,
    );
    return response;
  }

  Future<http.Response> getReferrals({required String token}) async {
    final headers = {
      "Authorization": "Bearer $token",
    };
    final response = await http.get(
      Uri.parse("${Secrets.baseUrl}${Secrets.referals}"),
      headers: headers,
    );
    return response;
  }

  Future<http.Response> youtubeKey({
    required String token,
  }) async {
    final headers = {
      "Authorization": "Bearer $token",
    };
    final response = await http.get(
      Uri.parse("${Secrets.baseUrl}${Secrets.configKeys}"),
      headers: headers,
    );
    return response;
  }

  Future<http.Response> playlist1(
      {required String apikey, required String playlistId}) async {
    String key = '&key=$apikey';
    final response1 = await http.get(
        Uri.parse(
            '${Secrets.youtubePlaylistUrl}${Secrets.part}${Secrets.playlistId}$playlistId$key'),
        headers: {
          "Accept": "application/json",
        });
    return response1;
  }

  Future<http.Response> updateUser(
      {required String token,
      required String name,
      required String accNum,
      required String ifsc,
      required String holder}) async {
    final body = {
      "name": name,
      "accountDetails": {
        "accountNumber": accNum,
        "ifsc": ifsc,
        "holderName": holder,
      },
    };
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    final response = await http.put(
      Uri.parse('${Secrets.baseUrl}${Secrets.updateUser}'),
      body: jsonEncode(body),
      headers: headers,
    );
    return response;
  }

  Future<http.Response> payementData({required String token}) async {
    final headers = {"Authorization": "Bearer $token"};
    final response = await http.get(
      Uri.parse('${Secrets.baseUrl}${Secrets.payementData}'),
      headers: headers,
    );
    return response;
  }

  Future<http.Response> requestWithdraw(
      {required String token, required String amount}) async {
    final headers = {
      "Authorization": "Bearer $token",
      "Content-Type":"application/json",
    };
    final body = {"amount": int.parse(amount)};
    final response = await http.post(
      Uri.parse('https://main-ford.vercel.app/api/payments/withdrawal'),
      body: jsonEncode(body),
      headers: headers,
    );
    return response;
  }

  Future<http.Response> forgotPass({required String email}) async {
    final body = {"email": email};
    final headers = {"Content-Type": "application/json"};
    final response = await http.post(
      Uri.parse('${Secrets.baseUrl}${Secrets.restPass}'),
      body: jsonEncode(body),
      headers: headers,
    );
    return response;
  }
}
