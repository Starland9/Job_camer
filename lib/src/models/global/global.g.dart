// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GlobalConfigAdapter extends TypeAdapter<GlobalConfig> {
  @override
  final int typeId = 4;

  @override
  GlobalConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GlobalConfig()
      ..isDarkMode = fields[0] as bool
      ..language = fields[1] as String
      ..isOnBoarding = fields[2] as bool
      ..user = fields[3] as User?;
  }

  @override
  void write(BinaryWriter writer, GlobalConfig obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.isDarkMode)
      ..writeByte(1)
      ..write(obj.language)
      ..writeByte(2)
      ..write(obj.isOnBoarding)
      ..writeByte(3)
      ..write(obj.user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlobalConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
