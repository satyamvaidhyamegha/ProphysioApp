import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:physio/physio/database/model/certificateDetailsModel.dart';
import 'package:physio/physio/database/repository/certificate_local_repository.dart';
import 'package:physio/physio/database/repository/onboard_local_repository.dart';

import '../database/model/onboardingDetailsModel.dart';

class CertiViewModel extends GetxController {
  var allCertiDetails = <CertificateDetailsModel>[].obs;

  CertificateLocalRepository certificateLocalRepository = CertificateLocalRepository();

  @override
  void onInit() {
    super.onInit();
    fetchAllDetails();
  }

  fetchAllDetails() async {
    var details = await certificateLocalRepository.loadDetails();
    allCertiDetails.value = details;
  }

  addDetails(CertificateDetailsModel certificateDetailsModel) {
    certificateLocalRepository.insertDetails(certificateDetailsModel);
    fetchAllDetails();
  }

  updateDetails(CertificateDetailsModel certificateDetailsModel) {
    certificateLocalRepository.updateDetails(certificateDetailsModel);
    fetchAllDetails();
  }
}
