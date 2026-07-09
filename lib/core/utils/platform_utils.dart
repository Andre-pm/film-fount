import 'package:web/web.dart' as web;

bool isPwa() {
  return web.window.matchMedia('(display-mode: standalone)').matches ||
      IOSNavigator(web.window.navigator).standalone == true;
}

bool isMobile() {
  return web.window.matchMedia('(pointer: coarse)').matches ||
      web.window.innerWidth <= 768;
}

extension type IOSNavigator(web.Navigator navigator) implements web.Navigator {
  external bool? get standalone;
}
