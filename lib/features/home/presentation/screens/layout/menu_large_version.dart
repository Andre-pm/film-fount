import 'package:film_fount/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuLargeVersion extends ConsumerWidget {
  const MenuLargeVersion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authControllerNotifier = ref.read(authNotifierProvider.notifier);

    return Row(
      children: [
        PopupMenuButton<String>(
          child: Text(
            'Perfil',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(35, 35, 35, 0.75),
            ),
          ),
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
            PopupMenuItem(
              value: 'accessProfile',
              child: Text('Acessar perfil'),
            ),
            PopupMenuItem(value: 'logout', child: Text('Sair')),
          ],
        ),

        const SizedBox(width: 70),
        InkWell(
          onTap: () {},
          hoverColor: Color.fromRGBO(241, 240, 236, 1),
          splashColor: Color.fromRGBO(241, 240, 236, 1),
          highlightColor: Color.fromRGBO(241, 240, 236, 1),
          child: Text(
            'Minha biblioteca',
            style: TextStyle(
              color: Color.fromRGBO(35, 35, 35, 1),
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(width: 70),
        InkWell(
          onTap: () {},
          hoverColor: Color.fromRGBO(241, 240, 236, 1),
          splashColor: Color.fromRGBO(241, 240, 236, 1),
          highlightColor: Color.fromRGBO(241, 240, 236, 1),
          child: Text(
            'Metas',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(35, 35, 35, 0.75),
            ),
          ),
        ),
        const SizedBox(width: 70),
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
