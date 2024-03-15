import 'dart:io';

import 'package:vsquareclasses/src/features/admin/couse_management/domain/entities/courseEntity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../constants/constants.dart';
part 'course_model.g.dart';

@JsonSerializable()
class CourseModel extends CourseEntity {
  const CourseModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.class_,
      required super.batch,
      required super.price,
      super.imageUrl,
      super.language,
      super.image,
      super.totalEnrolled = 0,
      required super.offerPrice,
      required super.durationType,
      required super.duration});

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
  CourseModel copyWith(
      {String? id,
      String? name,
      String? description,
      String? imageUrl,
      String? class_,
      String? durationType,
      String? batch,
      String? language,
      double? price,
      double? offerPrice,
      int? duration,
      int? totalEnrolled,
      File? image}) {
    return CourseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      class_: class_ ?? this.class_,
      batch: batch ?? this.batch,
      language: language ?? this.language,
      price: price ?? this.price,
      offerPrice: offerPrice ?? this.offerPrice,
      duration: duration ?? this.duration,
      totalEnrolled: totalEnrolled ?? this.totalEnrolled,
      durationType: durationType ?? this.durationType,
      image: image ?? this.image,
    );
  }

  factory CourseModel.blankInitialise() {
    return CourseModel(
        id: '',
        name: '',
        description: '',
        imageUrl: '',
        class_: Constants.className[0],
        batch: Constants.batchName[0],
        price: 0,
        offerPrice: 0,
        durationType: Constants.courseDurationType[0],
        duration: 0);
  }
}
