import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Profile {
  String MBTI;
  String job;
  String bloodType;

  Profile({
    required this.MBTI,
    required this.job,
    required this.bloodType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'MBTI': MBTI,
      'job': job,
      'bloodType': bloodType,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      MBTI: map['MBTI'] as String,
      job: map['job'] as String,
      bloodType: map['bloodType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);
}
