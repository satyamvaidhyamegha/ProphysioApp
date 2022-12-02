import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:physio/physio/database/repository/onboard_local_repository.dart';

import '../database/model/onboardingDetailsModel.dart';

class OnboardViewModel extends GetxController {
  var allOnboardDetails = <OnboardDetailsModel>[].obs;

  OnboardLocalRepository onboardLocalRepository = OnboardLocalRepository();

  @override
  void onInit() {
    super.onInit();
    fetchAllDetails();
  }

  fetchAllDetails() async {
    var details = await onboardLocalRepository.loadDetails();
    allOnboardDetails.value = details;
  }

  addDetails(OnboardDetailsModel onboardDetailsModel) {
    onboardLocalRepository.insertDetails(onboardDetailsModel);
    fetchAllDetails();
  }

  updateDetails(OnboardDetailsModel onboardDetailsModel) {
    onboardLocalRepository.updateDetails(onboardDetailsModel);
    fetchAllDetails();
  }
}
