# App 7: Egg Hunt

Discuss this app & get help on [Piazza](tiny.cc/cis195-piazza).
Please leave feedback by creating a GitHub issue or by posting on Piazza.
Remember -- Stack Overflow and Google are encouraged, but DO NOT copy code. Ideas may be discussed with classmates, but don't work together.

**Expected Duration:** 2+ hours

**Deadlines:** Friday, April 10th at **11:59pm**

- - - -

![](/apps/app-7/assets/fig1.png?raw=true)

## Objectives
* Make your seventh app
* Learn MapKit, a totally new framework & use your knowledge of Apple API design
* Learn to use Firebase Realtime Database, a fantastic "no-SQL" database
* Gain autonomy in making apps

While this app won't have much in the way of guided instruction, you are provided with stub code. In addition, the stub code will contain helpful comments and pre-implemented classes. Think of this app like a puzzle to solve!

## Topics
* MapKit
* MKPolyline
* MKAnnotation
* Firebase Realtime Database

## User Story
User's can collect eggs scattered around Penn campus, by tapping on the egg and then "Collect". User's can also "Drop" already collected eggs.

Each time an egg is either collected or dropped by a user, the information on the Firebase server is immediately updated. Those updates on the server in turn trigger an updated list of eggs being sent to the app, which should cause the interface to refresh with the new eggs.

Don't worry - Firebase makes this straightforward!

## Getting Started
* Download the [starter project](egg-hunt.zip)
    - Note that Cocoapods has already been used to install the `Firebase/Database` pod
* Note that because we have installed Cocoapods, **you must use the .xcodeworkspace** file instead of the .xcodeproj file
* Look around and get familiar with the codebase
    - Main.storyboard
    - ViewController.swift
    - EggAnnotation.swift
* Make sure the app compiles

## Install Firebase
In this project, we'll use **Firebase Realtime Database** to keep track of collected eggs. Although the Firebase Cocoapod has been installed for you, we still need to setup a Firebase project. I recommend watching this week's lecture to see how this is done. Alternatively, [follow the instructions here](https://firebase.google.com/docs/database/ios/start).
* When creating your Database, be sure to start it in *Test Mode*
* DO NOT use Cloud Firestore. Use Realtime Database.

Now that we've setup the Database, we'll populate our database with the contents of [egg.json](eggs.json). Download that file, and upload it to your database by following [this guide](https://support.google.com/firebase/answer/6386780?hl=en). The JSON contains a list of *annotation* coordinates - you will use these coordinates to populate the map with egg annotations.

The [Firebase documentation](https://firebase.google.com/docs/database/ios/read-and-write) should be used to complete this app.

## Requirements
* When the app opens, the map automatically zooms until it is centered on Penn campus.
* Displayed on the map are 6 eggs.
* Tapping on an egg displays a callout view, containing:
    - A label with the text "Egg <ID>".
    - A button with a title of "Collect" or "Drop", depending on whether the egg is currently collected.
* Tapping on a button inside the callout view toggles the `collected` state of that egg.
    - This should be immediately reflected in Firebase, as well as in your UI.
* A label displays the current number of collected eggs. This label is *ONLY* updated inside `refHandle`'s closure in `viewDidLoad()`.
* Changing a latitude or longitude value in the Firebase console should make that egg *immediately* update its position on the map.

## Suggested Implementation Order
*I recommend completing these requirements roughly in order. Please watch the lecture in it's entirety before starting.*

* Setup `ref` inside viewDidLoad.
* Setup `refHandle`, also inside viewDidLoad. This is where you'll fetch data from Firebase, decode that data into EggAnnotations, and update your UI.
    - *Hint: the first line should be something like* `refHandle = ref.child("eggs").observe(DataEventType.value) { (snapshot) in ... }`
    - *Hint: get an array of Egg objects with* `if let eggs = snapshot.value as? [NSDictionary] {...}`
* Implement `centerMapOnPennCampus()`
* Implement the MKMapView delegate functions
    - In `mapView(_:viewFor)`, you need to create a `MKAnnotationView` that looks like an egg, and has a callout view with a UILabel and tappable UIButton.
    - *Hint: An image named "egg" is located in the Asset catalog.*
    - `mapView(_:annotationView:calloutAccessoryControlTapped)` is responsible for reacting to MKAnnotationView button presses. This is where you'll toggle the state of your egg annotations, as well as update Firebase with the new `collected` value.
    - *Hint: the line where you update Firebase will end in* `.updateChildValues(["collected" : eggAnnotation.isCollected])`.

## Submission
Zip your *entire project folder*. Do this in the Finder by finding the **highest level folder** named "egg-hunt" and zipping that. This folder should include **both** the .xcproject file and a subfolder also named "egg-hunt". 

We need both of these, make sure to zip them all! Name the zipped file app7_lastname_firstname.zip and submit it on canvas.

Late submissions will be graded according to the policy described in Lecture 1, although extensions will be given in extenuating circumstances.
