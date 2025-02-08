import 'package:expensor/model/account.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

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
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE accounts(
            account_id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            amount DOUBLE,
            color TEXT,
            icon TEXT,
            last_update DATE
          )
        ''');
      }
    );
    

    return database;
  }

  void addAccount(Account account) async {
    final db = await database;
    await db.insert(
      'accounts',
      {
        'name': account.name,
        'amount': account.balance,
        'icon': account.icon.codePoint.toString(),
        'color': account.color.value,
        'last_update': DateTime.now().toIso8601String()
      }
    );
  }

  Future<List<Account>?> getAccounts() async {
    final db = await database;
    final accounts = await db.query('accounts');
    return accounts.map((account) => Account.fromMap(account)).toList();
  }
}