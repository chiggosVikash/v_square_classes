import 'package:flutter/material.dart';

import '../../../../../../../widgets/text_field_design_w.dart';

class PaymentFieldW extends StatelessWidget {
  final double width;
  final String _labelText;
  final Widget? _suffixIcon;
  final void Function(String)? _onChanged;
  final bool _isReadOnly;

  final TextEditingController _textFieldController;

  const PaymentFieldW(
      {super.key,
      required this.width,
      required String labelText,
      required TextEditingController textFieldController,
      bool isReadOnly = false,
        void Function(String)? onChanged,
      Widget? suffixIcon,})
      : _isReadOnly = isReadOnly, _onChanged = onChanged, _textFieldController = textFieldController, _suffixIcon = suffixIcon,
        _labelText = labelText;

  @override
  Widget build(BuildContext context) {
    return TextFieldDesign(
        width: width,
        child: TextFormField(
          readOnly: _isReadOnly,
          onChanged: _onChanged,
          keyboardType: TextInputType.number,
          controller: _textFieldController,
          decoration: InputDecoration(
            suffixIcon: _suffixIcon,
            border: InputBorder.none,
            labelText: _labelText,
          ),
        ));
  }
}
