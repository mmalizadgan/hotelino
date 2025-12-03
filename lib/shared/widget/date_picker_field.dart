import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelino/core/constants/constants.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class DatePickerField extends StatefulWidget {
  final String title;
  final String hint;
  final FormFieldSetter<JalaliRange?>? onSaved;
  final FormFieldValidator<JalaliRange?>? validator;
  final JalaliRange? initialValue;

  const DatePickerField({
    super.key,
    required this.title,
    required this.hint,
    this.onSaved,
    this.validator,
    this.initialValue,
  });

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  @override
  Widget build(BuildContext context) {
    return FormField<JalaliRange?>(
      initialValue: widget.initialValue,
      validator: widget.validator,
      onSaved: widget.onSaved,
      builder: (FormFieldState<JalaliRange?> state) {
        String dateText = state.value == null
            ? ""
            : "رفت :${state.value!.start.formatFullDate()}\nبرگشت: ${state.value!.end.formatFullDate()}";

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(widget.title, style: Theme.of(context).textTheme.titleMedium),

            SizedBox(height: 16.h),
            Directionality(
              textDirection: TextDirection.rtl,
              child: InkWell(
                onTap: () async {
                  final picked = await showPersianDateRangePicker(
                    context: context,
                    initialDateRange:
                        state.value ??
                        JalaliRange(
                          start: Jalali.now(),
                          end: Jalali.now().addDays(3),
                        ),
                    firstDate: Jalali(1400, 1),
                    lastDate: Jalali(1500, 12),
                    initialDate: Jalali.now(),
                  );
                  if (picked != null) {
                    state.didChange(picked);
                  }
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    hintText: widget.hint,
                    suffixIcon: const Icon(Icons.calendar_today),
                    errorText: state.errorText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        width: state.hasError ? 1 : 1.5,
                        color: state.hasError
                            ? Theme.of(context).colorScheme.error
                            : AppColors.lightBorder,
                      ),
                    ),
                  ),
                  child: Text(
                    dateText.isEmpty ? widget.hint : dateText,
                    style: TextStyle(
                      color: dateText.isEmpty ? Colors.grey : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
