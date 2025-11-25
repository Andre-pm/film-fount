import 'package:film_fount/core/domain/enums/menu_option.dart';
import 'package:film_fount/core/presentation/extensions/menu_options_ext.dart';
import 'package:film_fount/core/presentation/widgets/menu_bar_widget.dart';
import 'package:flutter/material.dart';

class UnderDevelopmentScreen extends StatelessWidget {
  final MenuOptions selectedOption;
  final IconData icon;
  const UnderDevelopmentScreen({
    super.key,
    required this.selectedOption,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isLargeVersion = constraints.maxWidth > 1200;

          return CustomScrollView(
            slivers: [
              MenuBarWidget(
                isLargeVersion: isLargeVersion,
                option: selectedOption,
              ),
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        size: 50,
                        icon,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      Text(
                        'A funcionalidade de ${selectedOption.title} está em desenvolvimento',
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Assim que ela estiver pronta, você será avisado!',
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
