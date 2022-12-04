import 'const.dart';

class UriHelper {
  static Uri uri(String path) {
    return Uri.parse(baseUrl + path);
  }
}
