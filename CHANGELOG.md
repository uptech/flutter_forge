# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

Generated by [Git Changelog](https://github.com/uptech/git-cl), an open source project brought to you by [UpTech Works, LLC](https://upte.ch). A consultancy that partners with companies to help **build**, **launch**, and **refine** their products.


## Unreleased - now


## [1.0.0] - 2023-06-19


## [0.8.1] - 2023-06-19

### Fixed
- AsyncState.when(errror:) passing incorrect error object


## [0.8.0] - 2023-06-08

### Added
- optional `builder` arg to ComponentWidget for overriding ui
- spacing between reducer receives in debug
- state.hashCode logging to the reducer debug

### Fixed
- typing of ComponentWidget to better provide type inference


## [0.7.0] - 2023-05-18

### Removed
- Equatable constraint required for State & AsyncState


## [0.6.0] - 2023-05-10

### Changed
- example depercations to new apis
- sdk constraint upperlimit to 4.0.0


## [0.5.0] - 2023-04-05

### Added
- SelectRebuilder widget


## [0.4.1] - 2023-03-16


## [0.4.0] - 2023-03-16

### Added
- TestStore class to facilitate testing reducer & effect logic
- loadAsyncStateWidget() to all stores
- AsyncStateWidget to facilitate automated AsyncState loading
- AsyncState and related subclasses


## [0.3.0] - 2023-02-03


## [0.2.0] - 2022-12-23

### Added
- Reducer pullback operation
- Reducer combine operation
- pullbackMapAction() function
- combineActions() function
- setContext() & context() to ViewStore, ScopedViewStore, & CombinedViewStore
- ReducerTuple/ActionTuple.noop() factory constructor

### Changed
- Reducer from a function typedef to a class
- Actions to be class based
- EffectTask to include BuildContext as a parameter
- ViewStoreInterface to require setContext() & context()
- ReducerTuple.effectTask to ReducerTuple.effectTasks
- EffectTask from typealias of func to a class
- pullbackEffectTask() to EffectTask.pullback()

### Removed
- viewBuilder functionality
- mapEffectTask()


## [0.1.0] - 2022-11-03

### Added
- concept of EffectTask to facilitate effecting code
- ComponentWidget to control widget creation & lifecycle
- postInitState() lifecycle hook to ComponentWidget
- dispose() lifecycle hook to ComponentWidget
- dispose() lifecycle hook to ComponentWidget
- postInitState() hook to the ComponentWidget

### Changed
- main entry from forge.dart to flutter_forge.dart
- Actions to be pure functions from State to State
- ViewStore action processing to be non-blocking
- ComponentWidget dispose() hook to have no params


## [0.0.1] - 2022-10-21

[1.0.0]: https://github.com/uptech/flutter_forge/compare/ec2c9d2...fb0d8d0
[0.8.1]: https://github.com/uptech/flutter_forge/compare/66a7845...ec2c9d2
[0.8.0]: https://github.com/uptech/flutter_forge/compare/eea5786...66a7845
[0.7.0]: https://github.com/uptech/flutter_forge/compare/71a5828...eea5786
[0.6.0]: https://github.com/uptech/flutter_forge/compare/de3a1da...71a5828
[0.5.0]: https://github.com/uptech/flutter_forge/compare/01d81ca...de3a1da
[0.4.1]: https://github.com/uptech/flutter_forge/compare/dbd3e1c...01d81ca
[0.4.0]: https://github.com/uptech/flutter_forge/compare/e45baf2...dbd3e1c
[0.3.0]: https://github.com/uptech/flutter_forge/compare/9c88e51...e45baf2
[0.2.0]: https://github.com/uptech/flutter_forge/compare/830938d...9c88e51
[0.1.0]: https://github.com/uptech/flutter_forge/compare/87cc218...830938d
[0.0.1]: https://github.com/uptech/flutter_forge/compare/fbfe9cf...87cc218
