import 'dart:convert';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String mobile;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobile,
  });

  factory UserModel.fromjson(Map<String, dynamic> jsonData) {
    return UserModel(
      id: jsonData['_id'],
      firstName: jsonData['firstName'],
      lastName: jsonData['lastName'],
      mobile: jsonData['mobile'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'mobile': mobile,
    };
  }
}

//         "_id": "672ddc84ea7d73dfecf4e384",
//         "email": "email@gmail.com",
//         "firstName": "a",
//         "lastName": "a",
//         "mobile": "01716874981",
