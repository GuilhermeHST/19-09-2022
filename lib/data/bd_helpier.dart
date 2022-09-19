import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {

  initDB() async{
    String databasesPath = await getDatabasesPath(); //esse 'getDatabasePath()' retorna a pasta de Banco de Dados do app
    String databaseName = join(databasesPath, 'pacotes.db');
    var db = openDatabase(
        databaseName,
        version: 1,
        onCreate: onCreate
    );
  }
  onCreate(Database db, int version) async{
    String sql = 'CREATE TABLE package (id INTEGER PRIMARY KEY, head varchar(100), url_image varchar(100), city varchar(100), title varchar(100), transport varchar(100), validy carchar(100), old_price double, current_price double, nights integer, discount double, person integer, free_cacellation boolean);';
    await db.execute(sql);

    sql =
        "INSERT INTO package (id, head, url_image, city, title, transport, validty, old_price, current_price, nights, discount, persons, free_cacellation) VALUES (1, 'Pacote Amsterdam', 'https://www.medlhoresdestinos.com.br/wp-content/uploads/2019/02/passagens-areas-capa2019-03.jpg', 'Amsterdam, NLD', 'Pacote Amsterdam - 2022 e 2023', 'Aéreo + Hospedagem', '01 Jan 2022 a 31 Dez 2023', '5.486', '4.389', 8, 20, 2, 1);";
    await db.execute(sql);

    sql =
    "INSERT INTO package (id, head, url_image, city, title, transport, validity, old_price, current_price, nights, discount, persons, free_cancellation) VALUES (2, 'Pacote Cancún', 'https://blogmaladeviagem.com.br/wp-content/uploads/2016/11/Blog-Mala-de-Viagem-cancun.jpg', 'CANCÚN, MEX', 'Pacote Cancún 2021', 'Aéreo + Transfer Grátis', '01 Nov 2021 a 31 Dez 2021', '6.500', '3.854', 5, 30, 1, 1);";
    await db.execute(sql);
  }
}