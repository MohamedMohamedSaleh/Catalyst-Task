// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:catalyst_task/features/users/models/user_model.dart';
import 'package:intl/intl.dart';

class PropertyModel {
  late final int id;
  late final int userId;
  late final String name;
  late final String description;
  late final String price;
  late final String location;
  late final List<String> images;
  late final String video;
  late final String createdAt;
  late final String updatedAt;
  late final UserModel user;
  PropertyModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    required this.price,
    required this.location,
    required this.images,
    required this.video,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  PropertyModel copyWith({
   int? id,
   int? userId,
   String? name,
   String? description,
   String? price,
   String? location,
   List<String>? images,
   String? video,
   String? createdAt,
   String? updatedAt,
   UserModel? user,
  }) {
    return PropertyModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      location: location ?? this.location,
      images: images?? this.images ,
      video: video ?? this.video,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'name': name,
      'description': description,
      'price': price,
      'location': location,
      'images': images,
      'video': video,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'user': user,
    };
  }

  factory PropertyModel.fromMap(Map<String, dynamic> map) {
    return PropertyModel(
      id: map['id'] ?? 0,
      userId:  map['user_id']?? 0,
      name:  map['name']?? '',
      description:  map['description'] ??'',
      price:  map['price'] ??'',
      location:  map['location'] ??'',
      // images:map['images'] == null ? [] : (jsonDecode(map['images'].toString()) as List<dynamic>).map((e) => e.toString()).toList(),
     images:map['images'] == [] || map['images'] == null ? _parseImageUrls("[\"property_images\\/ce212cdd8c1d461efc732edac7b639ed.png\",\"property_images\\/dbe50616da486f5f0ae8b769f7f45a42.png\"]") : _parseImageUrls(map['images'].toString()),
      video:  map['video'] ??'', 
      createdAt: DateFormat('MMM d, h:mm a').format((DateTime.parse(map['created_at']??""))),
      updatedAt: DateFormat('MMM d, h:mm a').format((DateTime.parse(map['updated_at']??""))),
      user: UserModel.fromMap(map['user']) ,
    );
  }
  String toJson() => json.encode(toMap());

  factory PropertyModel.fromJson(String source) => PropertyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PropertyModel(id: $id, userId: $userId, name: $name, description: $description, price: $price, location: $location, images: $images, video: $video, createdAt: $createdAt, updatedAt: $updatedAt, user: $user)';
  }

  @override
  bool operator ==(covariant PropertyModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.userId == userId &&
      other.name == name &&
      other.description == description &&
      other.price == price &&
      other.location == location &&
      other.images == images &&
      other.video == video &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.user == user;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userId.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      location.hashCode ^
      images.hashCode ^
      video.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      user.hashCode;
  }
}

List<String> _parseImageUrls(String imagesString) {
  // Check if the string looks like an improperly formatted JSON
  try {
    
  List<dynamic> imageList = json.decode(imagesString); 

       List<String> imagePaths = imageList.map((e) => e.toString()).toList(); 
  
return imagePaths;
  } catch (e) {
    // If the string is not a valid JSON, return an empty list
    return ["property_images/ce212cdd8c1d461efc732edac7b639ed.png", "property_images/dbe50616da486f5f0ae8b769f7f45a42.png"];
  }

}