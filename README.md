<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
# Dotted Button

A easy flutter package to have a custom button with various shape with dotted border.

## Getting started

### Add dependency

You can use the command to add dio as a dependency with the latest stable version:

```console
$ dart pub add dotted_button_flutter
```

Or you can manually add dio into the dependencies section in your pubspec.yaml:

```yaml
dependencies:
  dotted_button_flutter: ^replace-with-latest-version
```

### Super simple to use

```dart
DottedButton(
      onTap: () {
        setState(() {
          msg = 'Circle Border';
        });
      },
      height: 230,
      width: 100,
      margin: const EdgeInsets.all(20),
      borderType: BorderType.Oval,
      color: Colors.red,
      boxShadow: const [
        BoxShadow(
          color: Colors.black,
          blurRadius: 10,
        ),
      ],
      child: const Text("Circle Border"),
    ),
```
