import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/config/constants.dart';
import 'package:mywaiter_design/config/extensions.dart';
import 'package:mywaiter_design/widgets/sheet_scaffold.dart';

class Schedule {
  final String weekday;
  final TimeOfDay start;
  final TimeOfDay end;
  Schedule(this.weekday, this.start, this.end);
}

class InfoPage extends StatelessWidget {
  static String route = '/info';

  final schedule = {
    DateTime.monday: Schedule('monday', TimeOfDay(hour: 16, minute: 0),
        TimeOfDay(hour: 23, minute: 0)),
    DateTime.tuesday: Schedule('tuesday', TimeOfDay(hour: 16, minute: 0),
        TimeOfDay(hour: 23, minute: 0)),
    DateTime.wednesday: Schedule('wednesday', TimeOfDay(hour: 16, minute: 0),
        TimeOfDay(hour: 23, minute: 0)),
    DateTime.thursday: Schedule('thursday', TimeOfDay(hour: 16, minute: 0),
        TimeOfDay(hour: 23, minute: 0)),
    DateTime.friday: Schedule('friday', TimeOfDay(hour: 16, minute: 0),
        TimeOfDay(hour: 01, minute: 0)),
    DateTime.saturday: Schedule('saturday', TimeOfDay(hour: 16, minute: 0),
        TimeOfDay(hour: 01, minute: 0)),
    DateTime.sunday: Schedule('sunday', TimeOfDay(hour: 16, minute: 0),
        TimeOfDay(hour: 23, minute: 0)),
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SheetScaffold(
      background: Container(),
      body: Column(
        children: [
          InfoTile(
            leading: LucideIcons.mapPin,
            title: 'Address',
            child: Text('R. Vale Formoso 9, 1950-277 Lisboa'),
          ),
          SizedBox(height: 32),
          InfoTile(
            leading: LucideIcons.clock,
            title: 'Schedule',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...schedule.entries.map((schedule) {
                  final color = schedule.key == DateTime.now().weekday
                      ? theme.primaryColor
                      : null;
                  return Row(
                    //TODO: width errors
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        schedule.value.weekday.capitalize(),
                        style: TextStyle(color: color),
                      ),
                      Spacer(),
                      Text(
                        '${schedule.value.start.format(context)} - '
                        '${schedule.value.end.format(context)}',
                        style: TextStyle(color: color),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData leading;
  final String title;
  final Widget child;

  const InfoTile({
    required this.leading,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Icon(leading, size: kSmallIconSize),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.bodyText2!
                  .copyWith(color: theme.colorScheme.onSurface),
            ),
            SizedBox(height: 8),
            child,
          ],
        )
      ],
    );
  }
}
