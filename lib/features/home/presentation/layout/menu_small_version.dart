import 'package:film_fount/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:flutter/material.dart';

class MenuSmallVersion extends StatelessWidget {
  const MenuSmallVersion({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuthDatasource = FirebaseAuthDatasource();
    return Row(
      children: [
        PopupMenuButton<String>(
          icon: Icon(Icons.menu),
          onSelected: (value) async {
            switch (value) {
              case 'accessProfile':
                break;
              case 'logout':
                await firebaseAuthDatasource.signOut();
                if (context.mounted) {
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
