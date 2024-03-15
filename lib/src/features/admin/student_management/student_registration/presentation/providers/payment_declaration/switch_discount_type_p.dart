import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/src/constants/enums/discount_type_enum.dart';

final switchDiscountTypeProvider = AutoDisposeNotifierProvider<SwitchDiscountTypeP,(bool,DiscountTypeEnum)>(()=>SwitchDiscountTypeP());

class SwitchDiscountTypeP
    extends AutoDisposeNotifier<(bool, DiscountTypeEnum)> {
  @override
  (bool, DiscountTypeEnum) build() {
    return (false, DiscountTypeEnum.percentage);
  }

  DiscountTypeEnum switchDiscountType() {
    if (state.$2 == DiscountTypeEnum.percentage) {
      state = (true, DiscountTypeEnum.flat);
      return DiscountTypeEnum.flat;
    }
    state = (false, DiscountTypeEnum.percentage);
    return DiscountTypeEnum.percentage;
  }
}
