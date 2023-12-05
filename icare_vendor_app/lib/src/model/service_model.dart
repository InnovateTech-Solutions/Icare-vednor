class ServiceModel {
  final String name;
  final String description;
  final String vendorId;
  final String price;

  ServiceModel(
      {required this.name,
      required this.description,
      required this.price,
      required this.vendorId});

  tojson() {
    return {
      'Description': description,
      'Name': name,
      'Price': price,
      'Vendor_Id': vendorId
    };
  }

  factory ServiceModel.fromjson(Map<String, dynamic> data) {
    return ServiceModel(
        name: data['Name'],
        description: data['Description'],
        price: data['Price'],
        vendorId: data['Vendor_Id']);
  }
}
