// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      class_: json['class_'] as String,
      batch: json['batch'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
      language: json['language'] as String? ?? 'Hindi',
      totalEnrolled: json['totalEnrolled'] as int? ?? 0,
      offerPrice: (json['offerPrice'] as num).toDouble(),
      durationType: json['durationType'] as String,
      duration: json['duration'] as int,
    );

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'class_': instance.class_,
      'batch': instance.batch,
      'language': instance.language,
      'price': instance.price,
      'offerPrice': instance.offerPrice,
      'duration': instance.duration,
      'totalEnrolled': instance.totalEnrolled,
      'durationType': instance.durationType,
    };
