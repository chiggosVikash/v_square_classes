import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/extensions/context_extension.dart';
import 'package:vsquareclasses/src/extensions/gradient_extension.dart';

import 'header_text_w.dart';

class DocumentInfoW extends ConsumerWidget {
  final TextEditingController _studentAadhaarNoController;
  final TextEditingController _fatherAadhaarNoController;
  final TextEditingController _motherAadhaarNoController;

  const DocumentInfoW(
      {super.key,
      required TextEditingController fatherAadhaarNoController,
      required TextEditingController motherAadhaarNoController,
      required TextEditingController studentAadhaarNoController})
      : _motherAadhaarNoController = motherAadhaarNoController,
        _fatherAadhaarNoController = fatherAadhaarNoController,
        _studentAadhaarNoController = studentAadhaarNoController;

  final double _verSpace = .02;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderText(text: "Document Information"),
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
                      ))),
              SizedBox(
                height: context.height * _verSpace,
              ),
              TextFormField(
                controller: _studentAadhaarNoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Student Aadhaar No.",
                    suffixIcon: Icon(Icons.link)),
              ),
              SizedBox(height: context.height * _verSpace),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _fatherAadhaarNoController,
                decoration: const InputDecoration(
                    labelText: "Father's Aadhaar No.",
                    suffixIcon: Icon(Icons.person)),
              ),
              SizedBox(height: context.height * _verSpace),
              TextFormField(
                controller: _motherAadhaarNoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Mother's Aadhaar No",
                    suffixIcon: Icon(Icons.person)),
              ),
              SizedBox(
                height: context.height * _verSpace,
              ),
            ],
          ),
        )
      ],
    );
  }
}
