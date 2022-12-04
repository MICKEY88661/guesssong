import 'package:http/http.dart' as http;

class RemoteClient extends http.BaseClient {
  final http.Client _innerClient;

  RemoteClient() : _innerClient = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Content-type'] = 'application/json';
    request.headers['Accept'] = 'application/json';
    request.headers['Cache-Control'] = 'no-cache';
    return _innerClient.send(request);
  }

  @override
  void close() {
    _innerClient.close();
  }
}
