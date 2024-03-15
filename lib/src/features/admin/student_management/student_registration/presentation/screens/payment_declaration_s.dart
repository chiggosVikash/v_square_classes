import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '/src/constants/enums/discount_type_enum.dart';
import '/src/dialogue/dialogue.dart';
import '/src/features/admin/student_management/student_registration/presentation/providers/payment_declaration/save_payment_declaration_p.dart';
import '/src/features/admin/student_management/student_registration/presentation/providers/payment_declaration/switch_discount_type_p.dart';
import '../providers/payment_declaration/add_payment_declaration_p.dart';
import '/src/features/admin/student_management/student_registration/presentation/widgets/payment_declaration/payment_fee_w.dart';
import '/src/features/admin/student_management/student_registration/presentation/widgets/payment_declaration/payment_period_w.dart';
import '/src/features/admin/student_management/student_registration/presentation/widgets/payment_declaration/registration_fee_and_admission_fee_w.dart';
import '/src/features/admin/student_management/student_registration/presentation/widgets/payment_declaration/student_info_w.dart';

class PaymentDeclarationS extends ConsumerStatefulWidget {
  static const routeAddress = "payment_declaration_s";
  static const routeName = "Payment Declaration";

  final String _studentName;
  final String _registrationNo;
  final String _formNo;
  final String _course;
  const PaymentDeclarationS(
      {super.key,
      required String studentName,
      required String registrationNo,
      required String formNo,
      required String course})
      : _course = course,
        _formNo = formNo,
        _registrationNo = registrationNo,
        _studentName = studentName;

  @override
  ConsumerState<PaymentDeclarationS> createState() =>
      _PaymentDeclarationSState();
}

class _PaymentDeclarationSState extends ConsumerState<PaymentDeclarationS> {
  final _verSpace = .034;

  final _registrationFeeController = TextEditingController();
  final _admissionFeeController = TextEditingController();
  final _courseFeeController = TextEditingController();
  final _totalFeeController = TextEditingController();
  final _discountController = TextEditingController();
  final _netFeeController = TextEditingController();
  final _paidFeeController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _registrationFeeController.dispose();
    _admissionFeeController.dispose();
    _courseFeeController.dispose();
    _totalFeeController.dispose();
    _discountController.dispose();
    _netFeeController.dispose();
    _paidFeeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Declaration"),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              StudentInfoW(
                studentName: widget._studentName,
                registrationNo: widget._registrationNo,
                formNo: widget._formNo,
                course: widget._course,
              ),

              SizedBox(
                height: constraints.maxHeight * _verSpace,
              ),

              RegistrationFeeAndAdmissionFeeW(
                registrationFeeController: _registrationFeeController,
                admissionFeeController: _admissionFeeController,
                width: constraints.maxWidth * .48,
              ),

              SizedBox(
                height: constraints.maxHeight * _verSpace,
              ),

              /// Course Fee
              PaymentFieldW(
                onChanged: (value){
                 final totalFee =  ref
                      .read(addPaymentDeclarationProvider.notifier)
                      .calculateTotalFee(
                        registrationFee: _registrationFeeController.text,
                        admissionFee: _admissionFeeController.text,
                        courseFee: _courseFeeController.text,
                      );
                  _totalFeeController.text = totalFee.toString();

                },
                textFieldController: _courseFeeController,
                width: constraints.maxWidth,
                labelText: "Course Fee",
              ),

              SizedBox(
                height: constraints.maxHeight * _verSpace,
              ),

              PaymentPeriodW(width: constraints.maxWidth),

              SizedBox(
                height: constraints.maxHeight * _verSpace,
              ),

              PaymentFieldW(
                isReadOnly: true,
                textFieldController: _totalFeeController,
                width: constraints.maxWidth,
                labelText: "Total Fee",
              ),

              SizedBox(
                height: constraints.maxHeight * _verSpace,
              ),

              Consumer(
                builder: (context, ref, child) {
                  final selectedValue = ref.watch(switchDiscountTypeProvider);
                  return PaymentFieldW(
                    onChanged: (value){
                      _calculateNetAmount(discountType: selectedValue.$2);

                    },
                    textFieldController: _discountController,
                    width: constraints.maxWidth,
                    labelText: "Discount(${selectedValue.$2.name})",
                    suffixIcon:
                        Switch.adaptive(value: selectedValue.$1, onChanged: (value) {
                      final discountType = ref.read(switchDiscountTypeProvider.notifier).switchDiscountType();
                      _calculateNetAmount(discountType: discountType);

                        }),
                  );
                },
              ),

              SizedBox(
                height: constraints.maxHeight * _verSpace,
              ),

              PaymentFieldW(
                textFieldController: _netFeeController,
                width: constraints.maxWidth,
                labelText: "Net Fee",
              ),

              SizedBox(
                height: constraints.maxHeight * _verSpace,
              ),

              // PaymentFieldW(
              //   textFieldController: _paidFeeController,
              //   width: constraints.maxWidth,
              //   labelText: "Paid Fee",
              // ),
              //
              // SizedBox(
              //   height: constraints.maxHeight * _verSpace,
              // ),

              FilledButton.tonal(
                onPressed: () {
                  ref.read(addPaymentDeclarationProvider.notifier).assignStudentInfo(
                    registrationNo: widget._registrationNo,
                    studentName: widget._studentName,
                    courseId: widget._course,
                    formNo: widget._formNo,
                  );

                  ref.read(addPaymentDeclarationProvider.notifier).assignPaymentDeclarationData(
                      registrationFee: _registrationFeeController.text,
                      admissionFee: _admissionFeeController.text,
                      courseFee: _courseFeeController.text,
                      discount: _discountController.text,
                      netFee: _netFeeController.text,
                      totalFee: _totalFeeController.text, discountType: ref.read(switchDiscountTypeProvider).$2);

                  _showSavePaymentDeclarationProgressStatus();
                  ref.read(addPaymentDeclarationProvider.notifier).savePaymentDeclaration();


                },
                child: const Text("Save Payment Declaration"),
              ),

              SizedBox(
                height: constraints.maxHeight * _verSpace,
              ),
            ],
          ),
        );
      }),
    );
  }

  void _calculateNetAmount({required DiscountTypeEnum discountType}){
    final netFee = ref.read(addPaymentDeclarationProvider.notifier).calculateNetFee(
      totalFee: _totalFeeController.text,
      discount: _discountController.text,
      discountType:discountType,);
    _netFeeController.text = netFee.toString();
  }


  void _showSavePaymentDeclarationProgressStatus(){
     showDialog(
       builder: (context) {
         final state = ref.watch(savePaymentDeclarationProvider);
         if (state.isLoading) {
           return const SavingDialogue(title: "Saving Payment Declaration",);
         }
         if (state.hasError) {
           return FailedDialogue(
             message: state.error.toString(), cancelButton: () {
             context.pop();
           }, tryAgainButton: () {
             context.pop();
           },);
         }
         return SuccessfulDialogue(content: "Student Payment Declaration Created Successfully", onPressed: (){
           Navigator.pop(context);
         });
       },


        context: context,
     );
  }
}
