import 'package:flutter/material.dart';
import 'package:vsquareclasses/src/widgets/text_field_design_w.dart';

class CourseAndOfferPriceFieldsW extends StatelessWidget {
  final BoxConstraints constraints;
  final TextEditingController priceController;
  final TextEditingController offerPriceController;
  const CourseAndOfferPriceFieldsW(
      {Key? key,
      required this.constraints,
      required this.priceController,
      required this.offerPriceController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Course ID Text Field
        TextFieldDesign(
          width: constraints.maxWidth * 0.45,
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: priceController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: 'Price',
              hintText: 'Enter Price',
            ),
          ),
        ),

        /// Offer price field
        TextFieldDesign(
          width: constraints.maxWidth * 0.45,
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: offerPriceController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: 'Offer Price',
              hintText: 'Enter Offer Price',
            ),
          ),
        ),
      ],
    );
  }
}
