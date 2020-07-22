import 'package:dio/dio.dart';

class DioLoggingInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  DioLoggingInterceptors(this._dio);

  @override
  Future onRequest(RequestOptions options) async {
    print(
        "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl ?? "") + (options.path ?? "")}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters != null) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");
    if (options.headers.containsKey('requirestoken')) {
      options.headers.remove('requirestoken');
      String accessToken =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsic2liZWx1Il0sInVzZXJfbmFtZSI6IjE5OTgwMzE2MjAxODEyMTAwMyIsInNjb3BlIjpbIndyaXRlIl0sImV4cCI6MTU5NTMyNTk1MSwiYXV0aG9yaXRpZXMiOlsiUk9MRV9FTVBMT1lFRSJdLCJqdGkiOiJlZDI0MTI5NS1iYTRkLTRmNjUtYTY2MC1lY2JkNWRlMTBlYjEiLCJjbGllbnRfaWQiOiJzaWJlbHVBcHAifQ.PgR1UI5UUtRhSMK7trNwXAjym-eJMELytk1L0ibxCDs';
      options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    }
    return options;
  }

  @override
  Future onResponse(Response response) {
    print(
        "<-- ${response.statusCode} ${(response.request != null ? (response.request.baseUrl + response.request.path) : 'URL')}");
    print("Headers:");
    response.headers?.forEach((k, v) => print('$k: $v'));
    print("Response: ${response.data}");
    print("<-- END HTTP");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError dioError) async {
    print(
        "<-- ${dioError.message} ${(dioError.response?.request != null ? (dioError.response.request.baseUrl + dioError.response.request.path) : 'URL')}");
    print(
        "${dioError.response != null ? dioError.response.data : 'Unknown Error'}");
    print("<-- End error");
    print(' <====> ');
    // print('status code ====> ' + dioError.response.statusMessage);
    // if (responseCode == 401) {
    //   _dio.interceptors.requestLock.lock();
    //   _dio.interceptors.responseLock.lock();

    //   RequestOptions options = dioError.response.request;
    //   _dio.interceptors.requestLock.unlock();
    //   _dio.interceptors.responseLock.unlock();
    //   return _dio.request(options.path, options: options);
    // } else {
    //   super.onError(dioError);
    // }
    super.onError(dioError);
  }
}
