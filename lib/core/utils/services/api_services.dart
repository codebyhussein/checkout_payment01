import 'package:dio/dio.dart';

class ApiServices {
  final dio = Dio();

  Future<Response> post({
    required body,
    required String url,
    required String token,
    String? contentType,
    Map<String, String>? headers,
  }) async {
    var responce = await dio.post(
      url,
      data: body,
      options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: headers ??
              {
                'Authorization': 'Bearer $token',
              }),
    );

    return responce;
  }
}
