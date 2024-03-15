
import 'package:flutter/material.dart';
import '/src/extensions/context_extension.dart';

class FilterSubMenus extends StatelessWidget {
  const FilterSubMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: context.width * .02,
      runSpacing: context.height * .015,
      children: List.generate(5, (index) {
        return SizedBox(
          width: context.width * .4,
          child: CheckboxListTile(
              tileColor: context.colorScheme.surfaceVariant.withOpacity(.3),
              selectedTileColor: context.colorScheme.secondaryContainer,
              dense: true,
              visualDensity: VisualDensity.compact,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text("Submenu $index"),
              selected: index == 0 ? true : false,
              value: index == 0 ? true : false,
              onChanged: (changedVal) {}),
        );
      }),
    );
  }
}
