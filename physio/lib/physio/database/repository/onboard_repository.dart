import '../model/onboardingDetailsModel.dart';

abstract class OnboardRepository {
  Future<List<OnboardDetailsModel>> loadDetails();

  Future insertDetails(OnboardDetailsModel model);

  Future updateDetails(OnboardDetailsModel model);
}
