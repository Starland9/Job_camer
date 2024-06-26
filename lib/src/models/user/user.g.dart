// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 3;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as String,
      fullname: fields[1] as String,
      email: fields[2] as String,
      password: fields[3] as String,
      phone: fields[4] as String,
      profilePic: fields[6] as Uint8List,
      isAdmin: fields[5] as bool,
      pdfPath: fields[7] as String?,
      applications: (fields[8] as List).cast<Job>(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullname)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.isAdmin)
      ..writeByte(6)
      ..write(obj.profilePic)
      ..writeByte(7)
      ..write(obj.pdfPath)
      ..writeByte(8)
      ..write(obj.applications);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
