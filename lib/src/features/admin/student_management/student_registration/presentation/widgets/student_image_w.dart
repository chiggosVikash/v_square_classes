import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/extensions/context_extension.dart';
import 'package:vsquareclasses/src/features/admin/couse_management/presentation/providers/image_picker_p.dart';

import '../../../../../../exceptions/course_management_exception.dart';

class StudentImage extends ConsumerWidget {
  const StudentImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageValue = ref.watch(imagePickerProvider);
    return InkWell(
      onTap: (){
        ref.read(imagePickerProvider.notifier).pickMobileGalleryImage(imageQuality: 45);
      },
      child: Container(
        margin: EdgeInsets.only(top: context.height * .06, left: context.width * .02),
        height: context.height * .19,
        width: context.width * .38,
        decoration: BoxDecoration(
          /// if image is loaded successfully then show the image
        image:  imageValue.value != null ? DecorationImage(
            image: FileImage(imageValue.value!),
            fit: BoxFit.cover
          ):null,
          color: context.colorScheme.background,
          border: Border.all(color: context.colorScheme.secondaryContainer, width: context.width*.01),
            borderRadius: BorderRadius.circular(context.width*.05),
        ),
        child: LayoutBuilder(
          builder: (context,constraints) {

            /// if image is loading
            if(imageValue.isLoading){
              return const Center(child: RepaintBoundary(child: CircularProgressIndicator()),);
            }
            /// if any error occurs while loading image
            if(imageValue.hasError && imageValue.error.runtimeType == ImagePickerException){
              final imagePickerException = imageValue.error as ImagePickerException;
              Future((){
                _showImagePickerError(context, imagePickerException.message);
              });
            }


            /// if no image is loaded then show the add image icon
            return imageValue.value == null ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Icon(Icons.add, size: constraints.maxHeight*.3,color: context.colorScheme.secondary,),
                 Text("Add Image",
                  style: TextStyle(fontSize: ((constraints.maxHeight+constraints.maxWidth)*context.aspectRatio)*.11),)
              ],
            ): const SizedBox();
          }
        ),
      ),
    );
  }

  void _showImagePickerError(BuildContext context,String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}