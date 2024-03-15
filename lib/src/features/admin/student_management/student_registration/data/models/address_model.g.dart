// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      area: json['area'] as String,
      landmark: json['landmark'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      pinCode: json['pinCode'] as String,
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'area': instance.area,
      'landmark': instance.landmark,
      'city': instance.city,
      'state': instance.state,
      'pinCode': instance.pinCode,
    };
