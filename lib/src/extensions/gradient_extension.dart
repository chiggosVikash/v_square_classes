import 'dart:math';

import 'package:flutter/material.dart';

/// Purpose: This extension provides a way to generate a random LinearGradient object on a BuildContext.
///
/// Getter: randomGradient
///
/// Returns: A LinearGradient object with two random colors and opacity.
///
/// Description:
///
/// A new instance of Random is created.
/// Two random colors are generated using the nextUInt(255) method of the Random object.
/// Each random color is converted to a Color object with an opacity of 0.3 and 0.2, respectively.
/// A new LinearGradient object is created with the two random colors.
/// Optional Parameters:
///
/// begin: The alignment of the starting point of the gradient. Defaults to Alignment.topLeft.
/// end: The alignment of the ending point of the gradient. Defaults to Alignment.bottomRight.
extension RadomGradient on BuildContext {
  LinearGradient get randomGradient {
    final random = Random();
    final randomColor = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    final randomColor2 = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    return LinearGradient(
      colors: [randomColor.withOpacity(.3), randomColor2.withOpacity(.2)],
      // begin: Alignment.topLeft,
      // end: Alignment.bottomRight
    );
  }

  BoxDecoration get customBoxDecoration => BoxDecoration(
        color: Theme.of(this).canvasColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            blurRadius: 2,
            offset: const Offset(0, 3),
          )
        ],
      );
}
