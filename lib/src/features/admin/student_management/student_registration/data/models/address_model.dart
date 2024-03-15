
import 'package:json_annotation/json_annotation.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/domain/entities/address_entity.dart';
part 'address_model.g.dart';
@JsonSerializable()
class AddressModel extends AddressEntity{
  const AddressModel({required super.area, required super.landmark, required super.city, required super.state, required super.pinCode});

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  AddressModel copyWith({
    String? area,
    String? landmark,
    String? city,
    String? state,
    String? pinCode,
  }){
    return AddressModel(
      area: area ?? this.area,
      landmark: landmark ?? this.landmark,
      city: city ?? this.city,
      state: state ?? this.state,
      pinCode: pinCode ?? this.pinCode,
    );
  }
}