library load_on_component_init;

import 'package:flutter/material.dart';
import 'package:flutter_forge/flutter_forge.dart';

// State definition
@immutable
class State {
  const State({required this.count, required this.name});
  final int count;
  final String name;
}

class Environment {}

// Effect Tasks
final loadNameEffect =
    EffectTask<State, Environment, LoadOnComponentInitAction>(
        (state, environment, context) {
  return Future.delayed(const Duration(seconds: 5), () {})
      .then((_) => SetName("The Loaded Name"));
});

// Actions
abstract class LoadOnComponentInitAction implements ReducerAction {}

class Load implements LoadOnComponentInitAction {}

class SetName implements LoadOnComponentInitAction {
  final String name;
  SetName(this.name);
}

class Increment implements LoadOnComponentInitAction {}

// Reducer
final loadOnComponentInitReducer =
    Reducer<State, Environment, LoadOnComponentInitAction>(
        (State state, LoadOnComponentInitAction action) {
  if (action is Load) {
    return ReducerTuple(
        State(count: state.count, name: "Loading..."), [loadNameEffect]);
  } else if (action is SetName) {
    return ReducerTuple(State(count: state.count, name: action.name), []);
  } else if (action is Increment) {
    return ReducerTuple(State(count: state.count + 1, name: state.name), []);
  } else {
    return ReducerTuple(state, []);
  }
});

// Stateful Widget
class LoadOnInitComponentWidget
    extends ComponentWidget<State, LoadOnComponentInitAction> {
  LoadOnInitComponentWidget(
      {super.key, StoreInterface<State, LoadOnComponentInitAction>? store})
      : super(
            store: store ??
                Store(
                    initialState: const State(count: 0, name: "Initial"),
                    reducer: loadOnComponentInitReducer,
                    environment: Environment()));

  @override
  void postInitState(viewStore) {
    viewStore.send(Load());
  }

  @override
  Widget build(context, state, viewStore) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Load On Init Component'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(children: [
              Text(state.name),
              Text(
                '${state.count}',
                style: Theme.of(context).textTheme.headline4,
              ),
              OutlinedButton(
                  onPressed: () => viewStore.send(Increment()),
                  child: const Text("increment"))
            ])
          ],
        ),
      ),
    );
  }
}
