import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsquareclasses/src/extensions/context_extension.dart';

class HeaderText extends ConsumerWidget {
  final String text;
  const HeaderText({super.key,required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.width*.03,vertical: context.height*.01),
      child: Text(text,style: GoogleFonts.dmSans(
        fontSize:18
      ),),
    );
  }
}