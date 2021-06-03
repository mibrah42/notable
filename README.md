# Notable

Note-taking made simple

[Slides and Assets](https://drive.google.com/drive/folders/1mzqkhDY53__fdUqcy6j3Egw0EVrBm1Nv?usp=sharing)
<br/>
[Attendance](https://docs.google.com/spreadsheets/d/16qDvB8YZbs1CJi6l2qRJsTaFQSNEotjP1Z3H4EgcXAQ/edit#gid=1886061393)

### Create new project

```bash
$ flutter create notable
$ cd notable
```

### Add the necessary dependencies and configure launcher icon and splash screen

```yaml
dependencies:
  flutter:
    sdk: flutter
  hive: ^2.0.4
  hive_flutter: ^1.0.0
  intl: ^0.17.0
  keyboard_dismisser: ^2.0.0
  shared_preferences: ^2.0.6

dev_dependencies:
  build_runner: ^2.0.4
  flutter_launcher_icons: ^0.9.0
  flutter_native_splash: ^1.1.8+4
  flutter_test:
    sdk: flutter
  hive_generator: ^1.1.0
  lint: ^1.0.0

flutter_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/images/logo.png"
  adaptive_icon_background: "assets/images/logo.png"
  adaptive_icon_foreground: "assets/images/logo.png"

flutter_native_splash:
  color: "#181818"
  image: "assets/images/logo.png"
  android: true
  ios: true
```

### Create the file `analysis_options.yaml` in the root directory and add the following line

```yaml
include: package:lint/analysis_options.yaml
```

### Add asset and font directories to `pubspec.yaml`

```yaml
  fonts:
    - family: Satisfy
      fonts:
        - asset: assets/fonts/Satisfy/Satisfy-Regular.ttf
```

