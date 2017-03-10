# Purple Train 2: Elm Boogaloo

## Setup

* Make sure you have [elm v0.18](https://guide.elm-lang.org/install.html) installed
* Run `bin/setup`

## Developing

Run `yarn run watch` to start a watch server, which will recompile the elm files
when they are saved.

Use [elm-format](https://github.com/avh4/elm-format) with your editor. You can
set it up to format your Elm files when automatically saving them.

## Running the app

Run `yarn run start` to start the react native packager, which will serve the
javascript bundle to the device simulators.

Open the `ios/PurpleTrain.xcodeproj` and run the project to launch an iPhone simulator.

## Installing new versions of Elm Native UI (and other unsupported packages)

Elm Native UI is not in the Elm Package index, meaning it has to be installed by
hand (done automatically in `bin/setup`):

```
bin/sync-elm-native-ui
```

The script will do one of three things:

1. If you have a symlinked Elm Native UI dependency (because you are working on
   the Elm Native UI library), it will do nothing.
1. If you don't have the dependency it will clone it to the appropriate
   directory.
1. If you have the dependency, it will update the dependency to the version
   specified in `.elm-native-ui-version`.

## Installing new versions of packages in the Elm Package index

Since the `elm-package.json` and `elm-stuff/exact-dependencies.json` both
include packages that are not in the Elm Package index, you have to do some
juggling to install new packages that _are_ in the index (otherwise it complains
about "corrupt" packages).

1. Delete the `elm-native-ui` package (and any other self published packages)
   from `elm-package.json` and `elm-stuff/exact-dependencies.json`.
1. Run `elm-package install`
1. Re-add the deleted lines to both files.

## Releasing a new version

### Android

#### One-time setup
To build a production version of the app, you need to add these lines to your
`~/.gradle/gradle.properties`:

```
PURPLE_TRAIN_RELEASE_STORE_FILE=prod.keystore
PURPLE_TRAIN_RELEASE_KEY_ALIAS=purpletrain
PURPLE_TRAIN_RELEASE_STORE_PASSWORD=GET_FROM_1PASSWORD
PURPLE_TRAIN_RELEASE_KEY_PASSWORD=GET_FROM_1PASSWORD
```

Fill in the values marked GET_FROM_1PASSWORD with the values from the "Purple
Train release information" secure note.

Move the `prod.keystore` file from the 1Password note to the `android/app`
directory.

Ask the Google Play developer account owner (Melissa Xie) to add you to the
account so you can create new releases.

#### For each release

Build the signed APK:
```
cd android && ./gradlew assembleRelease
```
This creates a new APK here: `android/app/build/outputs/apk/app-release.apk`

Upload the signed apk to the Google Play developer console and release the new
version from there.

## License

Purple Train is Copyright (c) 2016-2017 Josh Steiner, Ian C. Anderson, and
thoughtbot, inc. It is free software, and may be redistributed under the GPL
license detailed in the [LICENSE] file.

[LICENSE]: /LICENSE

## About thoughtbot

![thoughtbot](http://presskit.thoughtbot.com/images/thoughtbot-logo-for-readmes.svg)

Purple Train is maintained and funded by thoughtbot, inc.
The names and logos for thoughtbot are trademarks of thoughtbot, inc.

We love open source software, Elm, and React Native. [Work with thoughtbot's
React Native development team][react-native] to design, develop, and grow your
product.

[react-native]:
https://thoughtbot.com/services/react?utm_source=github
