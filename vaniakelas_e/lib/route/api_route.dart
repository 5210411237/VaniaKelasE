import 'package:vania/vania.dart';
import 'package:vaniakelas_e/app/http/controllers/auth_controller.dart';
import 'package:vaniakelas_e/app/http/controllers/customer_controller.dart';
import 'package:vaniakelas_e/app/http/controllers/home_controller.dart';
import 'package:vaniakelas_e/app/http/controllers/order.dart';
import 'package:vaniakelas_e/app/http/controllers/orderitems.dart';
import 'package:vaniakelas_e/app/http/controllers/productnotes.dart';
import 'package:vaniakelas_e/app/http/controllers/products.dart';
import 'package:vaniakelas_e/app/http/controllers/vendors.dart';
import 'package:vaniakelas_e/app/http/middleware/authenticate.dart';
import 'package:vaniakelas_e/app/models/vendors.dart';

class ApiRoute implements Route {
  @override
  void register() {
    /// Base RoutePrefix
  Router.basePrefix('api');

    Router.post('/product', productController.create);
    Router.get('/product', productController.index);
    Router.put('/product/{prod_id}', productController.update);
    Router.delete('/product/{prod_id}', productController.destroy);

    Router.post('/customer', customerController.create);
    Router.get('/customer', customerController.index).middleware([AuthenticateMiddleware()]);
    Router.put('/customer/{cust_id}', customerController.update);
    Router.delete('/customer/{cust_id}', customerController.destroy);

    Router.post('/vendor', vendorController.create);
    Router.get('/vendor', vendorController.index);
    Router.put('/vendor/{vend_id}', vendorController.update);
    Router.delete('/vendor/{vend_id}', vendorController.destroy);

    Router.post('/order', orderController.create);
    Router.get('/order', orderController.index);
    Router.put('/order/{order_num}', orderController.update);
    Router.delete('/order/{order_num}', orderController.destroy);

    Router.post('/order/item', orderitems.create);
    Router.get('/order/item', orderitems.index);
    Router.put('/order/item/{order_item}', orderitems.update);
    Router.delete('/order/item/{order_item}', orderitems.destroy);

    Router.post('/product/note', productNoteController.create);
    Router.get('/product/note', productNoteController.index);
    Router.put('/product/note/{note_id}', productNoteController.update);
    Router.delete('/product/note/{note_id}', productNoteController.destroy);

    Router.post('/login', authController.login);
    Router.delete('/delete/token', authController.allLogout);
    Router.post('/register', authController.register);
  }
}
