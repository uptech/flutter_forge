library counter;

import 'package:flutter/material.dart';
import 'package:flutter_forge/flutter_forge.dart';
import 'package:equatable/equatable.dart';

// Environment
class CounterEnvironment {}

// State
@immutable
class CounterState extends Equatable {
  const CounterState({required this.count});

  final int count;

  @override
  List<Object> get props => [count];
}

// Actions
sealed class CounterAction implements ReducerAction {}

class CounterIncrementButtonTapped implements CounterAction {}

// Reducer
final counterReducer = Reducer<CounterState, CounterEnvironment, CounterAction>(
    (CounterState state, CounterAction action) {
  switch (action) {
    case CounterIncrementButtonTapped _:
      return ReducerTuple(CounterState(count: state.count + 1), []);
  }
});

// Widget
class Counter
    extends ComponentWidget<CounterState, CounterEnvironment, CounterAction> {
  const Counter({super.key, required super.store, super.builder});

  @override
  Widget build(context, viewStore) {
    // ignore: avoid_print
    print("CounterComponent build called");

    return Column(children: [
      Rebuilder(
          store: store,
          builder: (context, state, child) {
            return Text(
              '${state.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            );
          }),
      OutlinedButton(
          onPressed: () => viewStore.send(CounterIncrementButtonTapped()),
          child: const Text("increment"))
    ]);
  }

  @override
  void dispose() {
    // ignore: avoid_print
    print("Counter dispose() called");
    super.dispose();
  }
}
