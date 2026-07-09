import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

class PwaWarningWidget extends StatelessWidget {
  final bool isMobileDevice;
  final VoidCallback onClose;

  const PwaWarningWidget({
    super.key,
    required this.isMobileDevice,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          if (isMobileDevice) {
            showModalBottomSheet(
              context: context,
              builder: (_) {
                return Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  height: 310,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 24.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/favicon.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        SizedBox(height: 25),
                        Text(
                          strings.warningPWABottomSheetTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 25),
                        Text(
                          strings.warningPWABottomSheetFirstStep,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          strings.warningPWABottomSheetSecondStep,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 25),
                        Text(
                          strings.warningPWABottomSheetFinalStep,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 150),
          child: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        web.window.localStorage.setItem(
                          'closeWarningDisplayed',
                          'true',
                        );
                        onClose();
                      },
                      icon: Icon(Icons.close, color: theme.colorScheme.primary),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 15),
                        Text(
                          isMobileDevice
                              ? strings.warningPWAMobileTitle
                              : strings.warningPWAWebTitle,
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          isMobileDevice
                              ? strings.warningPWAMobileSubtitle
                              : strings.warningPWAWebSubtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: theme.colorScheme.primary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
