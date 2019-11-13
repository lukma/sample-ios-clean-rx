# sample-ios-clean-rx

This project explain how to implement clean architecture at ios application project.

## Table of Contents

- [Dependencies](#dependencies)
- [Structure](#structure)

## Dependencies

This project dependencies:

* [Swinject](https://github.com/Swinject/Swinject) is a dependency to handle dependency injection.
* [Moya](https://github.com/Moya/Moya) is a dependency contains network abstraction layer.
* [RxSwift](https://github.com/ReactiveX/RxSwift) is a dependency to handle observing, async operations and streams..

## Structure

This project structure:

```
data/
    feature/
        FeatureRepository.kt
        FeatureDataRepository.kt
        FeatureService.kt`
screens/
    feature/
        FeatureViewController.kt
        FeatureViewModel.kt
