import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// TableCalendar(
//   firstDay: DateTime.utc(2010, 10, 16),
//   lastDay: DateTime.utc(2030, 3, 14),
//   focusedDay: DateTime.now(),
// );

Future<Widget?> CalendarPopUpWindow(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context1) {
        return AlertDialog(
          content: Container(
            child: Column(
              children: [
                Text('Heelo'),
                Spacer(),
                Text('No'),
              ],
            ),
          ),
        );
      });
}
