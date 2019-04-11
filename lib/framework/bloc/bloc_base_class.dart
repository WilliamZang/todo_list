import 'dart:async';
import 'package:rxdart/rxdart.dart';

enum BlocMode {
  Switch,
  Merge,
  Concat,
}

abstract class Bloc<E, S> {
  Bloc(this._lastState, [BlocMode mode = BlocMode.Concat]) {
    switch (mode) {
      case BlocMode.Merge:
        _stateStream = _eventSubject.flatMap(_handleEvent);
        break;
      case BlocMode.Concat:
        _stateStream = _eventSubject.concatMap(_handleEvent);
        break;
      case BlocMode.Switch:
        _stateStream = _eventSubject.switchMap(_handleEvent);
        break;
    }

    _stateSubscription = _stateStream.listen((S newState) {
      _lastState = newState;
    });
  }

  dispatch(E event) {
    _eventSubject.add(event);
  }

  dispose() {
    _eventSubject.close();
    _stateSubscription.cancel();
  }

  Stream<S> get stateStream => _stateStream.startWith(_lastState);

//  Stream<S> get _stateStream {
//    StreamController controller = StreamController();
//    controller.sink.add(_lastState); // yield _lastState;
//    _stateStream.listen((S state) {
//      controller.sink.add(state);
//    });
//    return controller.stream;
//  }

  Stream<S> handleEvent(E event, {S lastState});

  Stream<S> _handleEvent(E event) async* {
    yield* handleEvent(event, lastState: _lastState);
  }

  S _lastState;
  final Subject<E> _eventSubject = PublishSubject();

  Observable<S> _stateStream;
  StreamSubscription<S> _stateSubscription;
}

//
//abstract class Bloc<Event> {
//  Bloc() {
//    StreamTransformer<Event, dynamic> transformer =
//        StreamTransformer.fromHandlers(handleData: _handleEvent);
//    _mergedStateStream = _eventStreamController.stream
//        .transform(transformer)
//        .asBroadcastStream();
//    _mergedStateStream.listen((state) {
//      _lastStates[state.runtimeType] = state;
//    });
//  }
//
//  dispatch(Event event) async {
//    _eventStreamController.sink.add(event);
//  }
//
//  dispose() {
//    _eventStreamController.close();
//  }
//
//  Stream<T> getStream<T>({T defaultValue}) async* {
//    if (_lastStates.containsKey(T)) {
//      _lastStates[T] = defaultValue;
//    }
//    yield defaultValue;
//    yield* _mergedStateStream.where((state) => state is T);
//  }
//
//  Stream handleEvent(Event event, {dynamic lastState});
//
//  void _handleEvent(Event event, StreamSink sink) {
//    Stream stream =
//        handleEvent(event, lastState: _lastStates[event.runtimeType]);
//    stream.listen(sink.add);
//  }
//
//  final Map<Type, dynamic> _lastStates = Map();
//  final StreamController<Event> _eventStreamController = StreamController();
//  Stream _mergedStateStream;
//}
