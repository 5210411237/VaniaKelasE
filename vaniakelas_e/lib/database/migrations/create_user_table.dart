import 'package:vania/vania.dart';

class CreateUserTable extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('user', () {
      id();
      string('username', length: 50);
      string('email', length: 80);
      string('password', length: 255 );
    });
  }

  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('user');
  }
}
