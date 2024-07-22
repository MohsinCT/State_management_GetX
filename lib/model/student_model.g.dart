// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StdItemAdapter extends TypeAdapter<StdItem> {
  @override
  final int typeId = 0;

  @override
  StdItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StdItem(
      name: fields[0] as String,
      age: fields[1] as int,
      phoneNumber: fields[3] as String,
      country: fields[4] as String,
      image: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StdItem obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StdItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
