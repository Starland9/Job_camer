// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobAdapter extends TypeAdapter<Job> {
  @override
  final int typeId = 1;

  @override
  Job read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Job(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      company: fields[3] as String,
      companyLogo: fields[4] as String,
      location: fields[5] as String,
      salary: fields[6] as String,
      requirements: fields[7] as String,
      type: fields[8] as JobType,
    );
  }

  @override
  void write(BinaryWriter writer, Job obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.company)
      ..writeByte(4)
      ..write(obj.companyLogo)
      ..writeByte(5)
      ..write(obj.location)
      ..writeByte(6)
      ..write(obj.salary)
      ..writeByte(7)
      ..write(obj.requirements)
      ..writeByte(8)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class JobTypeAdapter extends TypeAdapter<JobType> {
  @override
  final int typeId = 2;

  @override
  JobType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return JobType.fullTime;
      case 1:
        return JobType.partTime;
      case 2:
        return JobType.remote;
      default:
        return JobType.fullTime;
    }
  }

  @override
  void write(BinaryWriter writer, JobType obj) {
    switch (obj) {
      case JobType.fullTime:
        writer.writeByte(0);
        break;
      case JobType.partTime:
        writer.writeByte(1);
        break;
      case JobType.remote:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
