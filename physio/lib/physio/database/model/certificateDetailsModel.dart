import 'package:flutter/foundation.dart';

class CertificateDetailsModel {
  final int id;
  final String aboutYou;
  final String education;
  final String speciality;
  final String language;
  final String certificateName;
  final String issuingOrg;
  final String issueDate;
  final String media;
  final String name;


 CertificateDetailsModel({required this.id, required this.aboutYou, required this.education, required this.speciality,required this.language, required this.certificateName, required this.issuingOrg, required this.issueDate, required this.media, required this.name});

  toMap() => {
    'id': id,
    'aboutYou': aboutYou,
    'education': education,
    'speciality': speciality,
    'language': language,
    'certificateName': certificateName,
    'issuingOrg': issuingOrg,
    'issueDate': issueDate,
    'media': media,
    'name': name,
  };

  copy(
      {required int id,
        required String aboutYou,
        required String education,
        required String speciality,
        required String language,
        required String certificateName,
        required String issuingOrg,
        required String issueDate,
        required String media,
        required String name,
        }) =>
      CertificateDetailsModel(
        id: this.id,
        aboutYou: this.aboutYou,
        education: this.education,
        speciality: this.speciality,
        language: this.language,
        certificateName: this.certificateName,
        issuingOrg: this.issuingOrg,
        issueDate: this.issueDate,
        media: this.media,
        name: this.name,
      );

  @override
  String toString() =>
      id.toString() +
          " " +
          aboutYou +
          " " +
          education +
          " " +
          speciality +
          " " +
          language +
          " " +
          certificateName +
          " " +
          issuingOrg +
          " " +
          issueDate +
          " " +
          media +
          " " +
          name;

  static CertificateDetailsModel fromMap(Map<String, dynamic> json) {
    return CertificateDetailsModel(
      id: json['id'],
      aboutYou: json['aboutYou'],
      education: json['education'],
      speciality: json['speciality'],
      language: json['language'],
      certificateName: json['certificateName'],
      issuingOrg: json['issuingOrg'],
      issueDate: json['issueDate'],
      media: json['media'],
      name: json['name'],
    );
  }
}
