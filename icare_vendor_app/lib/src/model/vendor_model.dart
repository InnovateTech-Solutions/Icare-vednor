import 'package:cloud_firestore/cloud_firestore.dart';

class VendorModel {
  final String? id;
  final String username;
  final String password;
  final String email;
  final String phoneNumber;
  final String businessLicense;
  String businesImage;
  final String category;
  final String decription;
  final String address;
  final String coordanits;
  final List<String> opendayes;
  final String openClose;
  final bool status;

  VendorModel({
    this.id,
    required this.status,
    required this.username,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.businessLicense,
    required this.businesImage,
    required this.category,
    required this.decription,
    required this.address,
    required this.coordanits,
    required this.opendayes,
    required this.openClose,
  });

  tojson() {
    return {
      'Name': username,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'businessLicense': businessLicense,
      'Image': businesImage,
      'Category': category,
      'Description': decription,
      'Address': address,
      'Coordinates': coordanits,
      'opendayes': opendayes,
      'opentime': openClose,
      'status': status
    };
  }

  factory VendorModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;

    return VendorModel(
      id: documentSnapshot.id,
      username: data['Name'],
      password: data['email'],
      email: data['password'],
      phoneNumber: data['phoneNumber'],
      businessLicense: data['businessLicense'],
      businesImage: data['Image'],
      category: data['Category'],
      decription: data['Description'],
      address: data['Address'],
      coordanits: data['Coordinates'],
      opendayes: (data["opendayes"] as List).map((e) => e.toString()).toList(),
      openClose: data['opentime'],
      status: data['satus'] as bool,
    );
  }
}
