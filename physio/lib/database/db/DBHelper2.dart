import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:physio/database/model/certificateDetailsModel.dart';
import 'package:physio/database/model/onboardingDetailsModel.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseTwoHelper {
  final String tableName = "OnboardingTwoDetails";

  DatabaseTwoHelper._();

  static final DatabaseTwoHelper _db = DatabaseTwoHelper._();

  factory DatabaseTwoHelper() => _db;

  static Database? _dataBase;

  Future<Database?> get database async {
    if (_dataBase != null) return _dataBase;
    _dataBase = await initDB();
    return _dataBase;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    return openDatabase(join(documentsDirectory.path, 'pro_physio2.db'),
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  _onCreate(Database db, int newVersion) => db.execute(
    "CREATE TABLE $tableName(id INTEGER PRIMARY KEY,aboutYou TEXT, education TEXT, speciality TEXT, language TEXT, certificateName TEXT, issuingOrg TEXT, issueDate TEXT, media TEXT, name TEXT)",
  );

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute("DROP TABLE IF EXISTS $tableName");
    _onCreate(db, newVersion);
  }

  getCertificateData() async {
    var res = await ((await database)?.query(tableName));
    List<CertificateDetailsModel> list = res!.isNotEmpty
        ? res.map((item) => CertificateDetailsModel.fromMap(item)).toList()
        : [];
    return list;
  }

  insertDetails(CertificateDetailsModel model) async =>
      await ((await database)!.insert(tableName, model.toMap()));

  updateDetails(CertificateDetailsModel model) async =>
      await ((await database)!.update(tableName, model.toMap(),
          where: "id = ?", whereArgs: [model.id]));
}
