import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/config/constants.dart';
import 'package:mywaiter_design/widgets/sheet_scaffold.dart';

class Schedule {
  final int _weekday;
  final TimeOfDay? start;
  final TimeOfDay? end;
  const Schedule(this._weekday, [this.start, this.end])
      : assert(1 <= _weekday && _weekday <= 7),
        assert((start == null) ^ (end != null));

  String get weekday => _names[_weekday]!;
  bool get isToday => _weekday == DateTime.now().weekday;
  String date(BuildContext context) => start == null
      ? 'Closed'
      : '${start!.format(context)} - ${end!.format(context)}';

  final _names = const {
    DateTime.monday: 'Monday',
    DateTime.tuesday: 'Tuesday',
    DateTime.wednesday: 'Wednesday',
    DateTime.thursday: 'Thursday',
    DateTime.friday: 'Friday',
    DateTime.saturday: 'Saturday',
    DateTime.sunday: 'Sunday',
  };
}

class InfoPage extends StatelessWidget {
  static String route = '/info';

  final schedule = [
    Schedule(DateTime.monday),
    Schedule(DateTime.tuesday, TimeOfDay(hour: 16, minute: 0),
        TimeOfDay(hour: 23, minute: 0)),
    Schedule(DateTime.wednesday, TimeOfDay(hour: 16, minute: 0),
        TimeOfDay(hour: 23, minute: 0)),
    Schedule(DateTime.thursday, TimeOfDay(hour: 16, minute: 0),
        TimeOfDay(hour: 23, minute: 0)),
    Schedule(DateTime.friday, TimeOfDay(hour: 16, minute: 0),
        TimeOfDay(hour: 01, minute: 0)),
    Schedule(DateTime.saturday, TimeOfDay(hour: 16, minute: 0),
        TimeOfDay(hour: 01, minute: 0)),
    Schedule(DateTime.sunday, TimeOfDay(hour: 16, minute: 0),
        TimeOfDay(hour: 23, minute: 0)),
  ];

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
            child: Text(
              'R. Vale Formoso 9, 1950-277 Lisboa',
              style: theme.textTheme.bodyText1,
            ),
          ),
          SizedBox(height: 32),
          InfoTile(
            leading: LucideIcons.clock,
            title: 'Schedule',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...schedule.map((day) {
                  final style = theme.textTheme.bodyText1!.copyWith(
                    color: day.isToday ? theme.primaryColor : null,
                    height: 1.2,
                  );
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(day.weekday, style: style),
                      Text(day.date(context), style: style),
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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: theme.textTheme.bodyText2!
                    .copyWith(color: theme.colorScheme.onSurface),
              ),
              SizedBox(height: 8),
              child,
            ],
          ),
        ),
      ],
    );
  }
}
