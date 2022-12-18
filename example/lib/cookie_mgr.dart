import 'package:cookie_jar/cookie_jar.dart';
import 'package:diox/dio.dart';
import 'package:diox_cookie_manager/dio_cookie_manager.dart';

void main() async {
  final dio = Dio();
  final cookieJar = CookieJar();
  dio.interceptors
    ..add(LogInterceptor())
    ..add(CookieManager(cookieJar));
  await dio.get('https://baidu.com/');
  // Print cookies
  print(cookieJar.loadForRequest(Uri.parse('https://baidu.com/')));
  // second request with the cookie
  await dio.get('https://baidu.com/');
}
