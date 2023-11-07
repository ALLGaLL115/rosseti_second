// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SuggestionAdapter extends TypeAdapter<Suggestion> {
  @override
  final int typeId = 3;

  @override
  Suggestion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Suggestion(
      id: fields[0] as int?,
      authorId: fields[1] as int?,
      title: fields[2] as String?,
      topicId: fields[3] as int?,
      existingSolutionText: fields[4] as String?,
      existingSolutionImage: fields[5] as String?,
      existingSolutionVideo: fields[6] as String?,
      proposedSolutionText: fields[7] as String?,
      proposedSolutionImage: fields[8] as String?,
      proposedSolutionVideo: fields[9] as String?,
      positiveEffect: fields[10] as String?,
      statusId: fields[11] as int?,
      registrationNumber: fields[12] as dynamic,
      rating: fields[13] as int?,
      experted: fields[14] as int?,
      author: fields[15] as Suggestion?,
      comments: (fields[16] as List?)?.cast<Comment>(),
    );
  }

  @override
  void write(BinaryWriter writer, Suggestion obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.authorId)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.topicId)
      ..writeByte(4)
      ..write(obj.existingSolutionText)
      ..writeByte(5)
      ..write(obj.existingSolutionImage)
      ..writeByte(6)
      ..write(obj.existingSolutionVideo)
      ..writeByte(7)
      ..write(obj.proposedSolutionText)
      ..writeByte(8)
      ..write(obj.proposedSolutionImage)
      ..writeByte(9)
      ..write(obj.proposedSolutionVideo)
      ..writeByte(10)
      ..write(obj.positiveEffect)
      ..writeByte(11)
      ..write(obj.statusId)
      ..writeByte(12)
      ..write(obj.registrationNumber)
      ..writeByte(13)
      ..write(obj.rating)
      ..writeByte(14)
      ..write(obj.experted)
      ..writeByte(15)
      ..write(obj.author)
      ..writeByte(16)
      ..write(obj.comments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuggestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
