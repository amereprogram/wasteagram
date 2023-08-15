# wasteagram

ios mobile app using Flutter and Dart language. Enables coffee shop employees to document daily food waste in the form of "posts" consisting of a photo, number of leftover items, the current date, and the location of the device when the post is created. 
- Uses location package, Firebase Cloud Storage and Firebase Cloud Firestore for storing images and post data.
- Incorporates Semantic interactive widgets like buttons, to aid accessibility.
- Integrates the use of crash reporting (Sentry) to record application crashes.

    lib/: Contains Widgets, Screens, logic for retrieving and storing data with Firebase and model class to act as an intermediary "bucket" to store variable data.
  
    test/: Contains unit tests for the FoodWastePost model class.


# GIF visual example
![](https://github.com/amereprogram/wasteagram/blob/main/wasteagram.GIF)
