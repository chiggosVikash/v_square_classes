import 'package:flutter/foundation.dart';

import '../../data/models/address_model.dart';

@immutable
class AddressEntity {
  final String area;
  final String landmark;
  final String city;
  final String state;
  final String pinCode;
  const AddressEntity(
      {required this.area,
      required this.landmark,
      required this.city,
      required this.state,
      required this.pinCode});

  AddressModel toModel() => AddressModel(
      area: area,
      landmark: landmark,
      city: city,
      state: state,
      pinCode: pinCode
  );
}
