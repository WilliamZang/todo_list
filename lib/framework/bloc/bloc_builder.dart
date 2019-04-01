import 'package:flutter/widgets.dart';

import 'bloc_base_class.dart';

typedef BlocWidgetBuilder<S> = Widget Function(BuildContext context, S state);

class BlocBuilder<E, S, T extends Bloc<E, S>> extends StreamBuilder<S> {
  BlocBuilder({Key key, @required T bloc, @required BlocWidgetBuilder<S> builder})
      : super(
            key: key,
            stream: bloc.stateStream,
            builder: (BuildContext context, AsyncSnapshot<S> state) =>
                builder(context, state.data));
}
