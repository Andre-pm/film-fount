import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class EmptyLibraryMessage extends StatelessWidget {
  final int selectedOption;

  const EmptyLibraryMessage({super.key, required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Container(
      color: Color.fromRGBO(38, 38, 38, 1),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            selectedOption == 1
                ? strings.libraryWatchedSectionEmptyTitle
                : strings.libraryNotWatchedSectionEmptyTitle,
            style: TextStyle(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            selectedOption == 1
                ? strings.libraryWatchedSectionEmptyDescription
                : strings.libraryNotWatchedSectionEmptyDescription,
            style: TextStyle(color: theme.colorScheme.onSurface, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
