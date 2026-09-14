// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_post.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************


class ScheduledPostAdapter extends TypeAdapter<ScheduledPost> {
  @override
  final int typeId = 0;

  @override
  ScheduledPost read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScheduledPost(
      id: fields[0] as String,
      content: fields[1] as String,
      imagePath: fields[2] as String?,
      scheduledTime: fields[3] as DateTime,
      postType: fields[4] as String,
      isPublished: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ScheduledPost obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.scheduledTime)
      ..writeByte(4)
      ..write(obj.postType)
      ..writeByte(5)
      ..write(obj.isPublished);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduledPostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
