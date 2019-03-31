import 'dart:async';

abstract class Bloc<E, S> {
  Bloc(this._lastState) : _eventStreamController = StreamController<E>() {
    _mergedStateStream = _eventStreamController.stream
        .asyncExpand(_handleEvent)
        .asBroadcastStream();
    _stateSubscription = _mergedStateStream.listen((S newState) {
      _lastState = newState;
    });
  }

  dispatch(E event) {
    _eventStreamController.sink.add(event);
  }

  dispose() {
    _eventStreamController.close();
    _stateSubscription.cancel();
  }

  Stream<S> get stateStream async* {
    yield _lastState;
    yield* _mergedStateStream;
  }

  Stream<S> handleEvent(E event, {S lastState});

  Stream<S> _handleEvent(E event) async* {
    yield* handleEvent(event, lastState: _lastState);
  }

  S _lastState;
  final StreamController<E> _eventStreamController;
  Stream<S> _mergedStateStream;
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
