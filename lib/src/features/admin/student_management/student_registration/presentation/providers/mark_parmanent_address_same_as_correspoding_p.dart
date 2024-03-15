import 'package:flutter_riverpod/flutter_riverpod.dart';

final markPermanentAddressSameAsCorrespondingProvider =
    AutoDisposeNotifierProvider<MarkPermanentAddressSameAsCorrespondingP, bool>(
        () => MarkPermanentAddressSameAsCorrespondingP());

class MarkPermanentAddressSameAsCorrespondingP
    extends AutoDisposeNotifier<bool> {
  @override
  bool build() {
    return false;
  }

  void switchValue() {
    state = !state;
  }
}
