import 'package:vania/vania.dart';
import 'package:vaniakelas_e/route/api_route.dart';
import 'package:vaniakelas_e/route/web.dart';
import 'package:vaniakelas_e/route/web_socket.dart';

class RouteServiceProvider extends ServiceProvider {
  @override
  Future<void> boot() async {}

  @override
  Future<void> register() async {
    WebRoute().register();
    ApiRoute().register();
    WebSocketRoute().register();
  }
}
