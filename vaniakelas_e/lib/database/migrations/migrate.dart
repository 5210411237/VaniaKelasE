import 'dart:io';
import 'package:vania/vania.dart';
import 'package:vaniakelas_e/database/migrations/create_personal_access_tokens_table.dart';
import 'create_customer_table.dart';
import 'create_order_table.dart';
import 'create_orderitems_table.dart';
import 'create_vendors_table.dart';
import 'create_products_table.dart';
import 'create_productnotes_table.dart';
import 'create_user_table.dart';

void main(List<String> args) async {
  await MigrationConnection().setup();
  if (args.isNotEmpty && args.first.toLowerCase() == "migrate:fresh") {
    await Migrate().dropTables();
  } else {
    await Migrate().registry();
  }
  await MigrationConnection().closeConnection();
  exit(0);
}

class Migrate {
  registry() async{
		 await CreatePersonalAccessTokensTable().up();
		 await CreateUserTable().up();
		await CreateCustomerTable().up();
     await CreateVendorsTable().up();
     await CreateOrderTable().up();
     await CreateProductsTable().up();
     await CreateOrderitemsTable().up();
     await CreateProductnotesTable().up();
	}

  dropTables() async {
		 await CreateUserTable().down();
		 await CreateProductnotesTable().down();
		 await CreateProductsTable().down();
		 await CreateVendorsTable().down();
		 await CreateOrderitemsTable().down();
		 await CreateOrderTable().down();
		 await CreateCustomerTable().down();
	 }
}
