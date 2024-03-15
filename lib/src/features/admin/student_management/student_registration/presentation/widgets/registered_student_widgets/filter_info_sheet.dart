
import 'package:flutter/material.dart';
import '../../../../../../../constants/constants.dart';
import '/src/extensions/context_extension.dart';
import 'filter_sub_menu.dart';

class FilterInfoSheet extends StatelessWidget {
  const FilterInfoSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: (context.width - (context.width * .1)) / 2.5,
          child: SizedBox(
            width: context.height * .1,
            child: const Divider(
              thickness: 3,
            ),
          ),
        ),
        Column(
          children: [
            Expanded(
                child: ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: context.width * .04,
                  vertical: context.height * .02),
              children: [
                Text(
                  "Filter:",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: context.height * .02,
                ),
                Wrap(
                  spacing: context.width * .02,
                  runSpacing: context.height * .015,
                  children: List.generate(Constants.filterOptions.length, (index) {
                    return ChoiceChip(
                        side: BorderSide(
                          color: context.colorScheme.secondaryContainer,
                        ),
                        onSelected: (val) {},
                        label: Text(Constants.filterOptions[index]),
                        selected: index == 0 ? true : false);
                  }),
                ),
                const Divider(
                  thickness: .5,
                ),
                const FilterSubMenus()
              ],
            ))
          ],
        )
      ],
    );
  }
}
