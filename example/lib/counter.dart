library counter;

import 'package:flutter/material.dart';
import 'package:flutter_forge/flutter_forge.dart';

// Environment
class Environment {}

// State
@immutable
class State {
  const State({required this.count});
  final int count;
}

// Actions
abstract class CounterAction implements ReducerAction {}

class IncrementCounterByOne implements CounterAction {}

// Reducer
final counterReducer = Reducer<State, Environment, CounterAction>(
    (State state, CounterAction action) {
  if (action is IncrementCounterByOne) {
    return ReducerTuple(State(count: state.count + 1), []);
  } else {
    return ReducerTuple(state, []);
  }
});

// Widget
class Counter extends ComponentWidget<State, CounterAction> {
  Counter({super.key, StoreInterface<State, CounterAction>? store})
      : super(
            store: store ??
                Store(
                    initialState: const State(count: 0),
                    reducer: counterReducer,
                    environment: Environment()));

  @override
  Widget build(context, state, viewStore) {
    return Column(children: [
      Text(
        '${state.count}',
        style: Theme.of(context).textTheme.headline4,
      ),
      OutlinedButton(
          onPressed: () => viewStore.send(IncrementCounterByOne()),
          child: const Text("increment"))
    ]);
  }
}
