// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicDetailsModel _$BasicDetailsModelFromJson(Map<String, dynamic> json) =>
    BasicDetailsModel(
      studentName: json['studentName'] as String,
      standard: json['standard'] as String,
      batch: json['batch'] as String,
      gender: json['gender'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      fatherName: json['fatherName'] as String,
      motherName: json['motherName'] as String,
      category: json['category'] as String,
      imageUrl: json['imageUrl'] as String?,
      nationality: json['nationality'] as String,
      previousSchool: json['previousSchool'] as String,
    );

Map<String, dynamic> _$BasicDetailsModelToJson(BasicDetailsModel instance) =>
    <String, dynamic>{
      'studentName': instance.studentName,
      'standard': instance.standard,
      'batch': instance.batch,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'fatherName': instance.fatherName,
      'motherName': instance.motherName,
      'category': instance.category,
      'nationality': instance.nationality,
      'previousSchool': instance.previousSchool,
      'imageUrl': instance.imageUrl,
    };
