class OtpVerifyResponse {
  final bool valid;

  OtpVerifyResponse({
    required this.valid,
  });

  factory OtpVerifyResponse.fromJson(Map<String, dynamic> json) {
    return OtpVerifyResponse(valid: json['valid']);
  }
}
