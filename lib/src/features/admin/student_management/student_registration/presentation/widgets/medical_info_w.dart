import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/extensions/context_extension.dart';
import 'package:vsquareclasses/src/extensions/gradient_extension.dart';

import 'blood_group_w.dart';
import 'header_text_w.dart';

class MedicalInfo extends ConsumerWidget {
  final double verSpace;
  final TextEditingController _identificationMark;
  const MedicalInfo({super.key, required this.verSpace,required TextEditingController identificationMark}) : _identificationMark = identificationMark;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderText(text: "Medical Information"),
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
              SizedBox(
                height: context.height * verSpace,
              ),
              const BloodGroupField(),
              SizedBox(
                height: context.height * verSpace,
              ),
              TextFormField(
                controller: _identificationMark,
                decoration:
                    const InputDecoration(labelText: "Identification Mark *"),
              )
            ],
          ),
        )
      ],
    );
  }
}
