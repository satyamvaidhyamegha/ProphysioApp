import 'package:physio/database/model/certificateDetailsModel.dart';



abstract class CertificateRepository {
  Future<List<CertificateDetailsModel>> loadDetails();

  Future insertDetails(CertificateDetailsModel model);

  Future updateDetails(CertificateDetailsModel model);
}
