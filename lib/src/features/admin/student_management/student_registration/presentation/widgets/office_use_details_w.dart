import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsquareclasses/src/extensions/date_format_extension.dart';
import 'package:vsquareclasses/src/extensions/date_time_extension.dart';
import '../providers/is_form_no_valid_p.dart';
import '../providers/is_registration_no_valid_p.dart';
import '/src/extensions/context_extension.dart';
import '/src/extensions/gradient_extension.dart';

class OfficeUseDetails extends ConsumerWidget {
  final TextEditingController _formNoController;
  final TextEditingController _registrationNoController;
  final TextEditingController _registrationDateController;
  const OfficeUseDetails(
      {super.key,
      required TextEditingController formNoController,
      required TextEditingController registrationNoController,
      required TextEditingController registrationDateController})
      : _formNoController = formNoController,
        _registrationNoController = registrationNoController,
        _registrationDateController = registrationDateController;

  final double _verSpace = .02;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(
          horizontal: context.width * .02, vertical: context.height * .02),
      margin: EdgeInsets.only(
          left: context.width * .25,
          right: context.width * .02,
          top: context.height * .02,
          bottom: context.height * .02),
      decoration: context.customBoxDecoration,
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: constraints.maxWidth * .74,
              child: TextFormField(
                onChanged: (value) {
                  ref.read(isFormNoValidProvider.notifier).validateFormNo(value);
                },
                controller: _formNoController,
                decoration: InputDecoration(
                    labelText: "Form No *",
                    suffixIcon: Consumer(
                      builder: (context, ref, child) {
                        final status = ref.watch(isFormNoValidProvider);
                        return _validatedIcon(ref, status);
                      }
                    ),
                ),

              ),
            ),
            SizedBox(
              height: context.height * _verSpace,
            ),
            SizedBox(
              width: constraints.maxWidth * .74,
              child: TextFormField(
                controller: _registrationNoController,
                onChanged: (value) {
                  ref
                      .read(isRegistrationNoValidProvider.notifier)
                      .validateRegistrationNo(value);
                },
                decoration: InputDecoration(
                  labelText: "Registration No *",
                  suffixIcon: Consumer(
                    builder: (context, ref, child) {
                      final status = ref.watch(isRegistrationNoValidProvider);
                      return _validatedIcon(ref, status);
                    }
                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.height * _verSpace,
            ),
            SizedBox(
              width: constraints.maxWidth * .74,
              child: TextFormField(
                controller: _registrationDateController,
                readOnly: true,
                onTap: () {
                  _registrationDatePicker(context, ref);
                },
                decoration: const InputDecoration(
                    labelText: "Registration Date *",
                    suffixIcon: Icon(Icons.date_range)),
              ),
            ),
          ],
        );
      }),
    );
  }

  void _registrationDatePicker(BuildContext context, WidgetRef ref) {
    showDatePicker(
            context: context,
            firstDate: DateTime.now().lastThreeMonths,
            lastDate: DateTime.now(),
            initialDate: DateTime.now())
        .then((value) {
      if (value != null) {
        _registrationDateController.text =
            value.toIso8601String().formattedDate;
      }
    });
  }


  Widget _validatedIcon(WidgetRef ref, AsyncValue<bool> status) {
    if (status is AsyncLoading) {
      return const Center(
          child: RepaintBoundary(child: CircularProgressIndicator()));
    } else if (status is AsyncError) {
      return const Icon(
        Icons.error,
        color: Colors.red,
      );
    }
    return status.value!
        ? const Icon(
            Icons.check,
            color: Colors.green,
          )
        : const Icon(
            Icons.error,
            color: Colors.red,
          );
  }
}
