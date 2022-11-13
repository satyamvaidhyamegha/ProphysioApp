import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:physio/database/model/onboardingDetailsModel.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseOneHelper {
  final String tableName = "OnboardingOneDetails";

  DatabaseOneHelper._();

  static final DatabaseOneHelper _db = DatabaseOneHelper._();

  factory DatabaseOneHelper() => _db;

  static Database? _dataBase;

  Future<Database?> get database async {
    if (_dataBase != null) return _dataBase;
    _dataBase = await initDB();
    return _dataBase;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    return openDatabase(join(documentsDirectory.path, 'pro_physio.db'),
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  _onCreate(Database db, int newVersion) => db.execute(
        "CREATE TABLE $tableName(id INTEGER PRIMARY KEY,firstName TEXT, lastName TEXT, mobileNo TEXT, email TEXT, password TEXT, physioimg TEXT)",
      );

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute("DROP TABLE IF EXISTS $tableName");
    _onCreate(db, newVersion);
  }

  getOnboardOneData() async {
    var res = await ((await database)?.query(tableName));
    List<OnboardDetailsModel> list = res!.isNotEmpty
        ? res.map((item) => OnboardDetailsModel.fromMap(item)).toList()
        : [];
    return list;
  }

  insertDetails(OnboardDetailsModel model) async =>
      await ((await database)!.insert(tableName, model.toMap()));

  updateDetails(OnboardDetailsModel model) async =>
      await ((await database)!.update(tableName, model.toMap(),
          where: "id = ?", whereArgs: [model.id]));
}
