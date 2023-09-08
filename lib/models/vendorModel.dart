// ignore_for_file: file_names

class VendorModel {
  final String firstname;
  final String lastname;
  final String email;
  final String phone;

  VendorModel({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
  });

  VendorModel.unknown()
      : firstname = '',
        lastname = '',
        email = '',
        phone = '';

  factory VendorModel.fromJson(Map<dynamic, dynamic> json) => VendorModel(
        firstname: json['first_name'],
        lastname: json['last_name'],
        email: json['email'],
        phone: json['phone'] ?? '',
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['phone'] = phone;

    return data;
  }
}


