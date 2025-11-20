import 'package:film_fount/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuSmallVersion extends ConsumerWidget {
  const MenuSmallVersion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authControllerNotifier = ref.read(authNotifierProvider.notifier);

    return Row(
      children: [
        PopupMenuButton<String>(
          icon: Icon(Icons.menu),
          onSelected: (value) async {
            switch (value) {
              case 'accessProfile':
                break;
              case 'logout':
                final success = await authControllerNotifier.signOut();
                if (success && context.mounted) {
                  Navigator.of(context).pushReplacementNamed('/');
                }
                break;
              default:
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem(value: 'myLibrary', child: Text('Minha biblioteca')),
            PopupMenuItem(value: 'goals', child: Text('Metas')),
            PopupMenuItem(
              value: 'accessProfile',
              child: Text('Acessar perfil'),
            ),
            PopupMenuItem(value: 'logout', child: Text('Sair')),
          ],
        ),
        const SizedBox(width: 10),
        IconButton(
          icon: Icon(Icons.search_rounded),
          color: Colors.black,
          iconSize: 32,
          onPressed: () {},
        ),
      ],
    );
  }
}
