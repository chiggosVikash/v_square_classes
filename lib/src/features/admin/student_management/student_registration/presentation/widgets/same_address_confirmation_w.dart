

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/mark_parmanent_address_same_as_correspoding_p.dart';

class SameAddressConfirmationW extends ConsumerWidget{
  final bool value;
  const SameAddressConfirmationW({super.key,required this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(children: [
      Checkbox(value:value, onChanged: (value) {
        ref.read(markPermanentAddressSameAsCorrespondingProvider.notifier).switchValue();
      }),
      const Text("Same as correspondence address")
    ],);
  }
}