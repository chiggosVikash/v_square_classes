import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

/// CourseEntity is a class that represents the course entity
///  It is used to represent the courses in the application
///
@immutable
class CourseEntity {
  final String id;
  final String name;
  final String description;
  final String? imageUrl;
  final String class_;
  final String batch;
  final String language;
  final double price;
  final double offerPrice;
  final int duration;
  final int totalEnrolled;
  final String durationType;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final File? image;

  const CourseEntity({
    required this.id,
    required this.name,
    required this.description,
    this.image,
    this.imageUrl,
    required this.class_,
    required this.batch,
    this.language = 'Hindi',
    required this.durationType,
    required this.price,
    required this.offerPrice,
    required this.duration,
    this.totalEnrolled = 0,
  });
}
