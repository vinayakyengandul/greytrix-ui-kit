import 'dart:async';
import "package:universal_html/html.dart";
// ignore: avoid_web_libraries_in_flutter

class Dispatcher {
  static final shared = Dispatcher._internal();

  StreamSubscription<MouseEvent> _onDragOverSubscription;
  StreamSubscription<MouseEvent> _onDropSubscription;

  final _dragFunctions = <int, Function(MouseEvent)>{};
  final _dropFunctions = <int, Function(MouseEvent)>{};

  var currentZoneId = 0;

  Dispatcher._internal() {
    _onDropSubscription = document.body.onDrop.listen(_onDrop);
    _onDragOverSubscription =
        document.body.onDragOver.listen(_onDragOver);
  }

  void cancel() {
    _onDropSubscription.cancel();
    _onDragOverSubscription.cancel();
  }

  int addZone(
      {Function(MouseEvent e) onDragOver,
      Function(MouseEvent e) onDrop}) {
    if (onDragOver != null) {
      _dragFunctions[currentZoneId] = onDragOver;
    }

    if (onDrop != null) {
      _dropFunctions[currentZoneId] = onDrop;
    }

    return currentZoneId++;
  }

  void removeZone(int id) {
    _dragFunctions.remove(id);
    _dropFunctions.remove(id);
  }

  void _stopEvent(MouseEvent e) => e
    ..stopPropagation()
    ..stopImmediatePropagation()
    ..preventDefault();

  void _onDrop(MouseEvent e) {
    _stopEvent(e);

    for (final f in _dropFunctions.values) {
      f(e);
    }
  }

  void _onDragOver(MouseEvent e) {
    _stopEvent(e);

    for (final f in _dragFunctions.values) {
      f(e);
    }
  }
}
