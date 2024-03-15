import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/extensions/context_extension.dart';
import '../../../../../../exceptions/course_management_exception.dart';
import '../../../../couse_management/presentation/providers/add_course_management_data_p.dart';
import '../../../../couse_management/presentation/providers/image_picker_p.dart';

class CourseImageContainerW extends ConsumerWidget {
  const CourseImageContainerW({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageData = ref.watch(imagePickerProvider);
    // final imageUrl = ref.watch(
    //     addCourseManagementDataProvider.select((value) => value.imageUrl));

    return SizedBox(
      width: context.width,
      height: context.height * 0.26,
      child: InkWell(
        onTap: () async {
          final image = await ref
              .read(imagePickerProvider.notifier)
              .pickMobileGalleryImage(imageQuality: 50);
          if (image == null) return;
          ref.read(addCourseManagementDataProvider.notifier).addImage(image);
        },
        child: Card(
          // color: Colors.amber,
          child: Builder(builder: (context) {
            if (imageData is AsyncLoading) {
              return Center(
                  child: RepaintBoundary(
                      child: const CircularProgressIndicator()));
            }
            if (imageData is AsyncError && imageData.value == null) {
              final error = imageData.error as ImagePickerException;
              return Center(
                  child: Text(
                error.message,
              ));
            }
            if (imageData.value != null) {
              return Image.file(
                imageData.value!,
                fit: BoxFit.cover,
              );
            }
            return Icon(Icons.add_a_photo);
          }),
        ),
      ),
    );
  }
}
