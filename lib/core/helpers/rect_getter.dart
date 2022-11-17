import 'package:flutter/material.dart';

class RectGetter extends StatefulWidget {
  final GlobalKey<RectGetterState> key;
  final Widget child;

  static Rect? getRectFromKey(GlobalKey<RectGetterState> globalKey) {
    var object = globalKey.currentContext?.findRenderObject();
    var translation = object?.getTransformTo(null).getTranslation();
    var size = object?.semanticBounds.size;

    if (translation != null && size != null) {
      return Rect.fromLTWH(
          translation.x, translation.y, size.width, size.height);
    } else {
      return null;
    }
  }

  static GlobalKey<RectGetterState> createGlobalKey() {
    return GlobalKey<RectGetterState>();
  }

  const RectGetter({required this.key, required this.child}) : super(key: key);

  factory RectGetter.defaultKey({required Widget child}) {
    return RectGetter(
      key: GlobalKey(),
      child: child,
    );
  }

  Rect? getRect() => getRectFromKey(key);

  RectGetter clone() {
    return RectGetter.defaultKey(
      child: child,
    );
  }

  @override
  RectGetterState createState() => RectGetterState();
}

class RectGetterState extends State<RectGetter> {
  @override
  Widget build(BuildContext context) => widget.child;
}
