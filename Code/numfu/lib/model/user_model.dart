// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String cust_id;
  final String cust_firstname;
  final String cust_lastname;
  final String cust_phone;
  final String cust_email;
  final String password;
  final String profile_picture;
  final String address;
  final String lat;
  final String lng;
  UserModel({
    required this.cust_id,
    required this.cust_firstname,
    required this.cust_lastname,
    required this.cust_phone,
    required this.cust_email,
    required this.password,
    required this.profile_picture,
    required this.address,
    required this.lat,
    required this.lng,
  });

  UserModel copyWith({
    String? cust_id,
    String? cust_firstname,
    String? cust_lastname,
    String? cust_phone,
    String? cust_email,
    String? password,
    String? profile_picture,
    String? address,
    String? lat,
    String? lng,
  }) {
    return UserModel(
      cust_id: cust_id ?? this.cust_id,
      cust_firstname: cust_firstname ?? this.cust_firstname,
      cust_lastname: cust_lastname ?? this.cust_lastname,
      cust_phone: cust_phone ?? this.cust_phone,
      cust_email: cust_email ?? this.cust_email,
      password: password ?? this.password,
      profile_picture: profile_picture ?? this.profile_picture,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cust_id': cust_id,
      'cust_firstname': cust_firstname,
      'cust_lastname': cust_lastname,
      'cust_phone': cust_phone,
      'cust_email': cust_email,
      'password': password,
      'profile_picture': profile_picture,
      'address': address,
      'lat': lat,
      'lng': lng,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      cust_id: map['cust_id'] as String,
      cust_firstname: map['cust_firstname'] as String,
      cust_lastname: map['cust_lastname'] as String,
      cust_phone: map['cust_phone'] as String,
      cust_email: map['cust_email'] as String,
      password: map['password'] as String,
      profile_picture: map['profile_picture'] as String,
      address: map['address'] as String,
      lat: map['lat'] as String,
      lng: map['lng'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(cust_id: $cust_id, cust_firstname: $cust_firstname, cust_lastname: $cust_lastname, cust_phone: $cust_phone, cust_email: $cust_email, password: $password, profile_picture: $profile_picture, address: $address, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.cust_id == cust_id &&
        other.cust_firstname == cust_firstname &&
        other.cust_lastname == cust_lastname &&
        other.cust_phone == cust_phone &&
        other.cust_email == cust_email &&
        other.password == password &&
        other.profile_picture == profile_picture &&
        other.address == address &&
        other.lat == lat &&
        other.lng == lng;
  }

  @override
  int get hashCode {
    return cust_id.hashCode ^
        cust_firstname.hashCode ^
        cust_lastname.hashCode ^
        cust_phone.hashCode ^
        cust_email.hashCode ^
        password.hashCode ^
        profile_picture.hashCode ^
        address.hashCode ^
        lat.hashCode ^
        lng.hashCode;
  }
}
