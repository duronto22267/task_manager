class TaskModel {
  final String id;
  final String title;
  final String description;
  final String status;
  final String email;
  final String createdDate;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.email,
    required this.createdDate,
  });

  factory TaskModel.fromjson(Map<String, dynamic> jsonData) {
    return TaskModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      description: jsonData['description'],
      status: jsonData['status'],
      email: jsonData['email'],
      createdDate: jsonData['createdDate'],
    );
  }
}

// "_id": "6923579f880cc5d30a30030b",
//             "title": "zahirul islam",
//             "description": "entaer first desjjsjksos",
//             "status": "New",
//             "email": "zahirstateqatar@gmail.com",
//             "createdDate": "2025-10-02T06:21:45.327Z"
