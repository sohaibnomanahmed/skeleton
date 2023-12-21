# test

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Documentation

## Routing: Go Router

Here we need to setup a Routes class containing all information about the different routing possibilities, please see routes.dart file.

After this class is setup we can change the main class to adhere to GoRouter please see the changes in main.dart

When the app is setup for go routing, we can do those routing with help of methods from go router, like context.go(), context.goNamed(), context.push(), context.pushNamed(). Depending on how we want the application to function.

## Theming

## Localization

## Http

We can create http request from the http dependency. This depedency can have som problem with utf8 decoding, if so, this needs to be done manually please see the brreg_service.dart file.
