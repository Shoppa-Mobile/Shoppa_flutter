// ignore_for_file: file_names

import 'package:hive_flutter/hive_flutter.dart';

typedef UserId = String;

@HiveType(typeId: 1, adapterName: 'UserModelAdapter')
// we annotate this class to separate this class from a different class
class UserModel extends HiveObject {
  // now we register is as a type adapter
  @HiveField(0, defaultValue: 0)
  // Here we're registering each field thus seperating the fields in this class
  final int id;
  @HiveField(1)
  final String firstname;
  @HiveField(2)
  final String lastname;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String phone;

  UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
  });

  UserModel.unknown()
      : id = 0,
        firstname = '',
        lastname = '',
        email = '',
        phone = '';

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        firstname: json['first_name'],
        lastname: json['last_name'],
        email: json['email'],
        phone: json['phone'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['phone'] = phone;

    return data;
  }
}
// Now we run the command to generate the type adapter
// flutter packages pub run build_runner build --delete-conflicting-outputs

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] == null ? 0 : fields[0] as int,
      firstname: fields[1] as String,
      lastname: fields[2] as String,
      email: fields[3] as String,
      phone: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstname)
      ..writeByte(2)
      ..write(obj.lastname)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
