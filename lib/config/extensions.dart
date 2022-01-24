extension StringX on String {
  String capitalize() =>
      length > 0 ? this[0].toUpperCase() + substring(1).toLowerCase() : '';
}
