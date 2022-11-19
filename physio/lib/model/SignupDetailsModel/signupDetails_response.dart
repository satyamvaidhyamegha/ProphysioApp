class SignUpDetailsResponse {
  final String speciality;

  SignUpDetailsResponse({required this.speciality});

  factory SignUpDetailsResponse.fromJson(Map<dynamic, dynamic> json) {
    return SignUpDetailsResponse(speciality: json['result']['speciality']);
  }
}
