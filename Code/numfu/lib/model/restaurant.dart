// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class restaurant {
  final String res_name;
  final String ratting;
  final String logo;
  restaurant({
    required this.res_name,
    required this.ratting,
    required this.logo,
  });

  restaurant copyWith({
    String? res_name,
    String? ratting,
    String? logo,
  }) {
    return restaurant(
      res_name: res_name ?? this.res_name,
      ratting: ratting ?? this.ratting,
      logo: logo ?? this.logo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'res_name': res_name,
      'ratting': ratting,
      'logo': logo,
    };
  }

  factory restaurant.fromMap(Map<String, dynamic> map) {
    return restaurant(
      res_name: map['res_name'] as String,
      ratting: map['ratting'] as String,
      logo: map['logo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory restaurant.fromJson(String source) =>
      restaurant.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'restaurant(res_name: $res_name, ratting: $ratting, logo: $logo)';

  @override
  bool operator ==(covariant restaurant other) {
    if (identical(this, other)) return true;

    return other.res_name == res_name &&
        other.ratting == ratting &&
        other.logo == logo;
  }

  @override
  int get hashCode => res_name.hashCode ^ ratting.hashCode ^ logo.hashCode;
}
