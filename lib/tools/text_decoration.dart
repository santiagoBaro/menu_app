import 'package:flutter/material.dart';
import 'package:menuapp/tools/visual_assets.dart';

Shadow textShadow = Shadow(
  blurRadius: 10.0,
  color: Colors.black38,
  offset: Offset(3.0, 3.0),
);

Shadow textHilight = Shadow(
  blurRadius: 10.0,
  color: Colors.white38,
  offset: Offset(-2.0, -2.0),
);

TextStyle hintTextStyle = TextStyle(
  color: myAppTheme['HintTextColor'],
);

TextStyle primaryMessageTextStyle = TextStyle(
  color: myAppTheme['HighlightTextColor'],
  fontWeight: FontWeight.bold,
  shadows: [
    textShadow,
    textHilight,
  ],
);

TextStyle onboardingTextStyle = TextStyle(
  fontFamily: 'BerkshireSwash-Regular',
  fontSize: 30,
  shadows: [
    textShadow,
    textHilight,
  ],
  color: myAppTheme['PrimaryTextColor'],
);

TextStyle secondaryMessageTextStyle = TextStyle(
  color: myAppTheme['SecondaryTextColor'],
  fontWeight: FontWeight.bold,
  shadows: [
    textShadow,
    textHilight,
  ],
);

TextStyle accentTextStyle = TextStyle(
  fontSize: 10,
  color: myAppTheme['SecondaryTextColor'],
);

TextStyle titleTextStyle = TextStyle(
  fontSize: 30,
  color: myAppTheme['PrimaryTextColor'],
  shadows: [
    textShadow,
    textHilight,
  ],
);

TextStyle chipTextStyle = TextStyle(
  fontSize: 10,
  color: myAppTheme['SecondaryTextColor'],
);

TextStyle profileStatTextStyle = TextStyle(
  fontSize: 20,
  color: myAppTheme['HighlightTextColor'],
  shadows: [
    textShadow,
  ],
);

TextStyle hilightTextStyle = TextStyle(
  fontSize: 20,
  color: myAppTheme['HighlightTextColor'],
  shadows: [
    textShadow,
    textHilight,
  ],
);

TextStyle postTitleTextStyle = TextStyle(
  color: myAppTheme['HighlightTextColor'],
  fontSize: 20,
  shadows: [
    Shadow(
      blurRadius: 10.0,
      color: Colors.black38,
      offset: Offset(3.0, 3.0),
    ),
  ],
);

TextStyle onboardingMessageTextStyle = TextStyle(
  fontSize: 18,
  color: myAppTheme['SecondaryTextColor'],
  shadows: [
    textShadow,
    textHilight,
  ],
);
