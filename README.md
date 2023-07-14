
# vba_crypto_signal

## link to APK file
https://drive.google.com/file/d/1bAj7K06bnZ9AUPT_x-c4yy6JaBISQlo9/view?usp=sharing

## Overview
This project is a mini mobile app that includes a login screen and a home page. The app allows users to authenticate themselves using a username and password and then navigate to the home page upon successful authentication.

## Color Reference

| Color                        | Hex Code     |
| ---------------------------- | ------------ |
| Scaffold Background          | ![#0E2033](https://via.placeholder.com/10/0E2033?text=+) #0E2033     |
| Scaffold Background Secondary | ![#213345](https://via.placeholder.com/10/213345?text=+) #213345    |
| Grey                         | ![#8B8B8B](https://via.placeholder.com/10/8B8B8B?text=+) #8B8B8B       |
| Active Green                 | ![#60FFB5](https://via.placeholder.com/10/60FFB5?text=+) #60FFB5  |
| Gold                         | ![#EAB96B](https://via.placeholder.com/10/EAB96B?text=+) #EAB96B |


AppColor holds all this values as static variable.

```dart

AppColor.gold

AppText.mont1(
    "Continue",
    color: AppColor.grey,
);
```
## Features

## Features

> **Gap**

this is used to add spaces inbetween widgets, it's been customize for easy of use compare to ```sizedbox()```

```dart

// default 
Gap(height:20,width:30);

// when height and withd are the same 
Gap.both(30);

// empty space
Gap.shrink();

// constants [the number afet the s indicate the space]
Gap.s4 
Gap.s6 
Gap.s8 
Gap.s10
Gap.s12;
```

use case

```dart
Column(
    children:[
         Text(
            widget.title!,
            style: widget.titleStyle ??
                AppTextStyle.mont1.copyWith(
                  color: AppColor.grey,
                ),
          ),
          Gap.s8,
          AppText.mont1("Showing"),
    ]
)

```

> **Text**

TextStyle and Text where mad to suit the desing use case on the figma board.
this are all the avaialable options
| name             | size             |      Font weight                                             |
| ----------------- | -----------------|------------------------------------------------- |
| mont1 | 20 | w700
| mont2 | 14 | w600
| mont3 | 12 | w600
| mont4 | 13 | w400
| roboto | 14 | w400
| nunito1 | 12 | w500
| nunito2 | 12 | w400
| noto | 12 | w400
| eUkraine1 | 32 | w500
| eUkraine2 | 20 | w500


Parameters available for this widget

| parameter             | required             |      default      | type                                       |
| ----------------- | -----------------|----------------------------|--------------------- |
| text | yes | |String
| key | no | |Key
| multiText | no | true | bool
| overflow | no | TextOverflow.ellipsis | TextOverflow
| maxLines | no | | int
| height | no | | double
| centered | no | false | true
| textAlign | no | | TextAlign
| fontSize | no | | int
| fontStyle | no | | FontStyle
| fontWeight | no | | FontWeight
| decoration | no | | TextDecoration
| style | no | | TextStyle



Example

  `AppTextStyle`

```dart
 Text(
    "Testing",
    style: widget.titleStyle ??
        AppTextStyle.mont1.copyWith(
            color: AppColor.grey.shade700,
        ),
    )
```

`AppText`

```dart
AppText.mont1(text)

AppText.mont1(
    text,
    fontSize: 20,
    fontWeight: FontWeight.w800
)
```

> **Button**

this is used to add spaces inbetween widgets, it's been customize for easy of use compare to ```sizedbox()```

```dart

// default 
AppButton(
text: "Log In",
onTap: () {},
 )

```

