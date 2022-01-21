import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

Future<DateTime?> nativeDatePicker(BuildContext context, DateTime selectedDate) async {
  final DateTime? picked = await showRoundedDatePicker(
    height: MediaQuery.of(context).size.height / 2,
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime.parse('1900-01-01'),
    lastDate: DateTime.now(),
    borderRadius: 16,
    styleDatePicker: MaterialRoundedDatePickerStyle(
      textStyleDayButton: TextStyle(fontSize: 14, color: Colors.black),
      textStyleYearButton: TextStyle(
        fontSize: 32,
        color: Colors.white,
      ),
      textStyleDayHeader: TextStyle(
        fontSize: 14,
        color: Colors.black.withOpacity(0.5),
      ),
      textStyleCurrentDayOnCalendar: TextStyle(
          fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
      textStyleDayOnCalendar: TextStyle(fontSize: 14, color: Colors.black),
      textStyleDayOnCalendarSelected: TextStyle(
          fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
      textStyleDayOnCalendarDisabled:
      TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.1)),
      textStyleMonthYearHeader: TextStyle(
          fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
      paddingDatePicker: EdgeInsets.all(0),
      paddingMonthHeader: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 25),
      paddingActionBar: EdgeInsets.all(0),
      paddingDateYearHeader: EdgeInsets.all(10),
      sizeArrow: 30,
      colorArrowNext: Colors.white,
      colorArrowPrevious: Colors.white,
      marginLeftArrowPrevious: 16,
      marginTopArrowPrevious: 16,
      marginTopArrowNext: 16,
      marginRightArrowNext: 32,
      textStyleButtonAction: TextStyle(fontSize: 14, color: Colors.black),
      textStyleButtonPositive: TextStyle(
          fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
      textStyleButtonNegative:
      TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.5)),
      decorationDateSelected: BoxDecoration(
          color: Colors.blue, shape: BoxShape.circle),
      backgroundPicker: Colors.white,
      backgroundActionBar: Colors.blue,
      backgroundHeaderMonth: Colors.blue.withOpacity(0.9),
    ),
    styleYearPicker: MaterialRoundedYearPickerStyle(
      textStyleYear: TextStyle(fontSize: 18, color: Colors.black),
      textStyleYearSelected: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      heightYearRow: 50,
      backgroundPicker: Colors.white,
    ),
    theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.blue,
        textSelectionColor: Colors.blue),
  );
  if (picked != null) {
    return picked;
  } else {
    return null;
  }
}
