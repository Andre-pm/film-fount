import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LibraryCategorySelector extends StatelessWidget {
  final int selectedOption;
  final Function(int) onOptionSelected;

  const LibraryCategorySelector({
    super.key,
    required this.selectedOption,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        spacing: 15,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildOption(
            context,
            index: 0,
            title: strings.libraryAllSection,
            isSelected: selectedOption == 0,
            theme: theme,
          ),
          _buildOption(
            context,
            index: 1,
            title: strings.libraryWatchedSection,
            isSelected: selectedOption == 1,
            theme: theme,
          ),
          _buildOption(
            context,
            index: 2,
            title: strings.libraryNotWatchedSection,
            isSelected: selectedOption == 2,
            theme: theme,
          ),
        ],
      ),
    );
  }

  Widget _buildOption(
    BuildContext context, {
    required int index,
    required String title,
    required bool isSelected,
    required ThemeData theme,
  }) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () => onOptionSelected(index),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.secondary
              : const Color.fromARGB(255, 159, 159, 159),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(title),
      ),
    );
  }
}
