import 'package:film_fount/features/goals/presentation/widgets/goal_register_bottom_sheet.dart';
import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class EmptyGoalMessage extends StatelessWidget {
  const EmptyGoalMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color.fromRGBO(22, 22, 22, 1),
          ),
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pessoais',
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 15),
              Center(
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromRGBO(38, 38, 38, 1),
                    ),
                    height: 150,
                    width: 350,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 50,
                          color: theme.colorScheme.onSurface,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Adicionar Meta',
                          style: TextStyle(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Crie uma meta pessoal',
                          style: TextStyle(
                            color: theme.colorScheme.onSurface,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.black54,
                      elevation: 10,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => FractionallySizedBox(
                        heightFactor: 0.8,
                        child: GoalRegisterBottomSheet(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color.fromRGBO(22, 22, 22, 1),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Comunitárias',
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
