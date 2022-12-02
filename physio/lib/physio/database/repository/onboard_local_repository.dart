import 'package:physio/physio/database/db/DBHelper.dart';
import 'package:physio/physio/database/model/onboardingDetailsModel.dart';
import 'package:sqflite/sqflite.dart';

import 'onboard_repository.dart';

class OnboardLocalRepository implements OnboardRepository {
  final DatabaseOneHelper _databaseOneHelper = DatabaseOneHelper();

  @override
  loadDetails() async => await _databaseOneHelper.getOnboardOneData();

  @override
  insertDetails(OnboardDetailsModel model) async =>
      await _databaseOneHelper.insertDetails(model);

  @override
  updateDetails(OnboardDetailsModel model) async =>
      await _databaseOneHelper.updateDetails(model);
}
