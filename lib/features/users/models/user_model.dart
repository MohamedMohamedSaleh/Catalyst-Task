// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:intl/intl.dart';

class UserModel {
  late final int id;
  late final String name;
  late final String email;
  late final String phone;
  late final String role;
  late final String profileImage;
  late final String introVideo;
  late final String createdAt;
  late final String updatedAt;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.profileImage,
    required this.introVideo,
    required this.createdAt,
    required this.updatedAt,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? role,
    String? profileImage,
    String? introVideo,
    String? createdAt,
    String? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      profileImage: profileImage ?? this.profileImage,
      introVideo: introVideo ?? this.introVideo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
      'profileImage': profileImage,
      'introVideo': introVideo,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'] ?? 'name',
      email: map['email'] ??'name@example.com',
      phone: map['phone']??'01200564211' ,
      role: map['role']??'Client' ,
      profileImage:map['profile_image'] == null? "https://bio3.catalyst.com.eg/public/Catalyst_portfolio/IMG_0997%20(1).jpg": map['profile_image'].toString().startsWith("http")? map['profile_image'] : "https://test.catalystegy.com/public/${map['profile_image']}" ,
      introVideo: map['intro_video']??"https://bio3.catalyst.com.eg/public/Catalyst_portfolio/techtest.mp4",
      createdAt: DateFormat('MMM d, h:mm a').format((DateTime.parse(map['created_at']??""))),
      updatedAt: DateFormat('MMM d, h:mm a').format((DateTime.parse(map['updated_at']??""))),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, phone: $phone, role: $role, profileImage: $profileImage, introVideo: $introVideo, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.phone == phone &&
      other.role == role &&
      other.profileImage == profileImage &&
      other.introVideo == introVideo &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      role.hashCode ^
      profileImage.hashCode ^
      introVideo.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
  }
}
