import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/constants/enums/address_type_enum.dart';
import 'package:vsquareclasses/src/extensions/context_extension.dart';
import 'package:vsquareclasses/src/extensions/gradient_extension.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/presentation/providers/mark_parmanent_address_same_as_correspoding_p.dart';
import 'package:vsquareclasses/src/features/admin/student_management/student_registration/presentation/widgets/same_address_confirmation_w.dart';

import 'header_text_w.dart';

class AddressInfo extends ConsumerWidget {
  final String addressType;
  final AddressTypeEnum _addressTypeEnum;

  /// text field controllers
  final TextEditingController _areaController;
  final TextEditingController _landmarkController;
  final TextEditingController _cityController;
  final TextEditingController _stateController;
  final TextEditingController _pinCodeController;
  final Function(bool value)? onSameAddressConfirmation;
  const AddressInfo(
      {super.key,
        this.onSameAddressConfirmation,
      required this.addressType,
      required TextEditingController areaController,
      required TextEditingController landmarkController,
      required TextEditingController cityController,
      required TextEditingController stateController,
      required TextEditingController pinCodeController,
      required AddressTypeEnum addressTypeEnum})
      : _pinCodeController = pinCodeController,
        _stateController = stateController,
        _cityController = cityController,
        _landmarkController = landmarkController,
        _areaController = areaController,
        _addressTypeEnum = addressTypeEnum;

  final double _verSpace = .02;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderText(text: addressType),
        Container(
          decoration: context.customBoxDecoration,
          padding: EdgeInsets.symmetric(
              horizontal: context.width * .03, vertical: context.height * .02),
          margin: EdgeInsets.symmetric(
              horizontal: context.width * .02, vertical: context.height * .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: SizedBox(
                width: context.width * .1,
                child: const Divider(
                  thickness: 3,
                ),
              )),
              _addressTypeEnum == AddressTypeEnum.permanentAddress
                  ? Consumer(
                      builder: (context, ref, child) {
                        final selectedValue = ref.watch(markPermanentAddressSameAsCorrespondingProvider);
                        Future((){
                          onSameAddressConfirmation!(selectedValue);
                        });

                        return SameAddressConfirmationW(value: selectedValue,);
                      },
                    )
                  : const SizedBox(),
              SizedBox(
                height: context.height * _verSpace,
              ),
              TextFormField(
                controller: _areaController,
                decoration: const InputDecoration(
                    labelText: "Area *", suffixIcon: Icon(Icons.area_chart)),
              ),
              SizedBox(
                height: context.height * _verSpace,
              ),
              TextFormField(
                controller: _landmarkController,
                decoration: const InputDecoration(
                    labelText: "Landmark*", suffixIcon: Icon(Icons.landscape)),
              ),
              SizedBox(
                height: context.height * _verSpace,
              ),
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(
                    labelText: "City *", suffixIcon: Icon(Icons.abc)),
              ),
              SizedBox(
                height: context.height * _verSpace,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.width * .42,
                    child: TextFormField(
                      controller: _stateController,
                      decoration: const InputDecoration(
                          labelText: "State *", suffixIcon: Icon(Icons.abc)),
                    ),
                  ),
                  SizedBox(
                    width: context.width * .42,
                    child: TextFormField(
                      controller: _pinCodeController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: "Pin Code *",
                          suffixIcon: Icon(Icons.onetwothree)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
