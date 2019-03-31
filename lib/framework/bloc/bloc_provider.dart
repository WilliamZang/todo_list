import 'package:flutter/widgets.dart';

import 'bloc_base_class.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  BlocProvider(T bloc, {@required Widget child})
      : _bloc = bloc,
        _inheritedWidget = _BlocProvider(bloc, child);

  static T of<T extends Bloc>(BuildContext context) {
    final type = _typeOf<_BlocProvider<T>>();
    final _BlocProvider<T> provider = context
        .ancestorInheritedElementForWidgetOfExactType(type)
        ?.widget as _BlocProvider<T>;

    return provider?._bloc;
  }

  final Widget _inheritedWidget;
  final T _bloc;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static Type _typeOf<T>() => T;
}

class _BlocProviderState<T extends Bloc> extends State<BlocProvider<T>> {
  @override
  void dispose() {
    widget._bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget._inheritedWidget;
  }
}

class _BlocProvider<T extends Bloc> extends InheritedWidget {
  _BlocProvider(this._bloc, Widget child) : super(child: child);

  final T _bloc;

  @override
  bool updateShouldNotify(_) => false;
}
