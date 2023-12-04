// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as int?,
      fullName: fields[1] as String?,
      phone: fields[2] as String?,
      email: fields[4] as String?,
      commentsCount: fields[5] as int?,
      ratingsCount: fields[6] as int?,
      acceptedProposalsCount: fields[7] as int?,
      deniedProposalsCount: fields[8] as int?,
      proposalsCount: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.commentsCount)
      ..writeByte(6)
      ..write(obj.ratingsCount)
      ..writeByte(7)
      ..write(obj.acceptedProposalsCount)
      ..writeByte(8)
      ..write(obj.deniedProposalsCount)
      ..writeByte(9)
      ..write(obj.proposalsCount);
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
