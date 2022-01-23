import 'package:flutter/material.dart';
import 'package:mywaiter_design/widgets/sheet_scaffold.dart';

class InfoPage extends StatelessWidget {
  static String route = '/info';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SheetScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('info'),
        ],
      ),
    );
  }
}
