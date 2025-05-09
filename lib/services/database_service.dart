import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _database;
  static final DatabaseService instance = DatabaseService._constructor();

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await getDatabase();
    return _database!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'expensor_db.db');
    final database = await openDatabase(databasePath, version: 1,
        onCreate: (db, version) async {
      await db.execute('''
    CREATE TABLE accounts (
      account_id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      amount REAL NOT NULL,
      color INTEGER NOT NULL,
      icon TEXT NOT NULL,
      last_update TEXT NOT NULL
    );
  ''');

      await db.execute('''
  INSERT INTO accounts (name, amount, color, icon, last_update) 
  VALUES ('BBVA', 2000, 4278190080, '984246', '2025-02-09T15:04:02.748096');
''');

      await db.execute('''
    CREATE TABLE categories (
      category_id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      icon TEXT NOT NULL,
      color INTEGER NOT NULL
    );
  ''');

      await db.execute('''
  INSERT INTO categories (name, icon, color) 
  VALUES ('Food', '58026', 16711680);
''');

      await db.execute('''
    CREATE TABLE transaction_types (
      transaction_type_id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL
    );
  ''');

      await db.execute('''
  INSERT INTO transaction_types (name) 
  VALUES ('Expense');
''');

      await db.execute('''
  INSERT INTO transaction_types (name) 
  VALUES ('Income');
''');

      await db.execute('''
  INSERT INTO transaction_types (name) 
  VALUES ('Transfer');
''');

      await db.execute('''
    CREATE TABLE transactions (
      transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
      description TEXT NOT NULL,
      date TEXT NOT NULL,
      amount REAL NOT NULL,
      category_id INTEGER,
      account_id INTEGER NOT NULL,
      transaction_type_id INTEGER,
      FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE SET NULL,
      FOREIGN KEY (account_id) REFERENCES accounts(account_id) ON DELETE CASCADE,
      FOREIGN KEY (transaction_type_id) REFERENCES transaction_types(transaction_type_id) ON DELETE CASCADE
    );
  ''');
    });

    return database;
  }
}
