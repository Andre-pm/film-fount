import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension DateStringExtension on String {
  String toDayMonthInWords(BuildContext context) {
    try {
      final parsed = DateTime.parse(this);
      final day = parsed.day.toString();
      final year = parsed.year.toString();
      final strings = AppLocalizations.of(context)!;
      final monthNames = [
        '',
        strings.monthJanuary,
        strings.monthFebruary,
        strings.monthMarch,
        strings.monthApril,
        strings.monthMay,
        strings.monthJune,
        strings.monthJuly,
        strings.monthAugust,
        strings.monthSeptember,
        strings.monthOctober,
        strings.monthNovember,
        strings.monthDecember,
      ];
      final month = monthNames[parsed.month];
      return '$day de $month de $year';
    } catch (_) {
      return this;
    }
  }

  String toYear() {
    try {
      final parsed = DateTime.parse(this);
      final year = parsed.year.toString();
      return year;
    } catch (_) {
      return this;
    }
  }
}

extension NullableStringExt on String? {
  String get orEmpty => this ?? '';
}
