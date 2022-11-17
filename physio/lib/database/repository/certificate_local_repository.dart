import 'package:physio/database/db/DBHelper2.dart';
import 'package:physio/database/model/certificateDetailsModel.dart';
import 'package:physio/database/repository/CertificateRepository.dart';
import 'package:sqflite/sqflite.dart';



class CertificateLocalRepository implements CertificateRepository {
  final DatabaseTwoHelper _databaseTwoHelper = DatabaseTwoHelper();

  @override
  loadDetails() async => await _databaseTwoHelper.getCertificateData();

  @override
  insertDetails(CertificateDetailsModel model) async =>
      await _databaseTwoHelper.insertDetails(model);

  @override
  updateDetails(CertificateDetailsModel model) async =>
      await _databaseTwoHelper.updateDetails(model);
}
