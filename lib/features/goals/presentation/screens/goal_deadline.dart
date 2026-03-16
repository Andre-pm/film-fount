import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoalDeadline extends ConsumerStatefulWidget {
  final List selectedMovies;

  const GoalDeadline({super.key, required this.selectedMovies});

  @override
  ConsumerState<GoalDeadline> createState() => _GoalDeadlineState();
}

class _GoalDeadlineState extends ConsumerState<GoalDeadline> {
  final TextEditingController _goalNameController = TextEditingController();
  final TextEditingController _goalTimeController = TextEditingController();
  int _currentSliderDozenValue = 0;
  int _currentSliderUnitValue = 5;

  @override
  void dispose() {
    _goalNameController.dispose();
    _goalTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final strings = AppLocalizations.of(context)!;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isLargeVersion = constraints.maxWidth >= 1200;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                titleSpacing: 100,
                leadingWidth: 100,
                floating: true,
                backgroundColor: Theme.of(context).colorScheme.onSurface,
                leading: BackButton(
                  color: Colors.black87,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 25,
                  ).copyWith(top: 25),
                  child: Text(
                    'Defina um nome para sua meta',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                  child: TextFormField(
                    controller: _goalNameController,
                    decoration: InputDecoration(
                      hintText: 'Nome da meta',
                      hintStyle: TextStyle(
                        color: theme.colorScheme.onSurface.withAlpha(150),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Período',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: isLargeVersion
                            ? constraints.maxWidth * 0.25
                            : constraints.maxWidth * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: CupertinoPicker(
                                itemExtent: 100,
                                onSelectedItemChanged: (int value) {
                                  setState(() {
                                    _currentSliderDozenValue = value;
                                  });
                                },
                                scrollController: FixedExtentScrollController(
                                  initialItem: _currentSliderDozenValue,
                                ),
                                children: List.generate(
                                  10,
                                  (index) => Center(
                                    child: Text(
                                      '$index',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 150,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: CupertinoPicker(
                                itemExtent: 100,
                                onSelectedItemChanged: (int value) {
                                  setState(() {
                                    _currentSliderUnitValue = value;
                                  });
                                },
                                scrollController: FixedExtentScrollController(
                                  initialItem: _currentSliderUnitValue,
                                ),
                                children: List.generate(
                                  10,
                                  (index) => Center(
                                    child: Text(
                                      '$index',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'dias',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
