

class SignUpDetailsResponse {
  final int id;
  final int physioId;
  final String language;

  SignUpDetailsResponse({required this.id,required this.physioId,required this.language});

  factory SignUpDetailsResponse.fromJson(Map<dynamic, dynamic> json) {
    return SignUpDetailsResponse(id: json['id'], physioId: json['physioid'], language: json['language']);
  }
}