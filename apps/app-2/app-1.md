# App 1: Tic Tac Toe

Discuss this app & get help on [Piazza](https://tiny.cc/cis195-piazza).
Please leave feedback by creating a GitHub issue or by posting on Piazza.
Remember -- Stack Overflow and Google are encouraged, but DO NOT copy code. Ideas may be discussed with classmates, but don't work together.

This assignment has 2 parts. Part A covers the interface and app structure, and Part B covers the game logic. **You must submit each section to canvas by the due date.** Part B will be added next week.

**Expected Duration:** 1+ hours for Part A, and 2+ hours for Part B.

**Deadlines:**
* Part A: Thursday, Feb. 6th at **4:20pm**
* Part B: Thursday, Feb. 13th at **4:20pm**

- - - -

## Objectives
* Make your first app
* Learn about interface builder and swift
* Get familiar with UIViewController, UIButton, UILabel, and UIView

![](/apps/app-1/assets/fig1.png?raw=true)

## Topics

#### UIKit
* UIViewController
* UIButton
* UILabel

#### Swift
* Properties
* Enums
* Optionals
* Functions
* Data structures

#### IB (Interface Builder)
* IBAction
* IBOutlet
* IBOutlet collections
* Element tags

---

# Part A: Tic Tac
## Step 0: Create a new project
* Open Xcode
* Select "new project" from the start screen, or use File > New > Project in the menu bar
* Select "Single View Application"
* Name the project "app1_lastname_firstname"

## Step 1: Import assets
* Using the file menu on the left, open `Assets.xcassets`.
* Download the image assets from [this link](/apps/app-1/assets/app-1-assets.zip) (click 'download').
* There will be 3 image files for each symbol -- this is to account for different iPhone screen resolutions. [More info if you're curious.](https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/image-size-and-resolution/).
* Drag all 9 of the image files into your assets file; this is called an "Asset Catalog".

## Step 2: Build the game board
* Go to the storyboard.
* Drag `UIButton`s into your `view` to construct the game grid, using the screenshots above as a reference.
* Set each button's `title` to be blank, and set the `image` field to "mark-none" (one of the images you just imported).
* Make the size of the buttons consistent.

## Step 3: Hook up the game board
* Go to `ViewController.swift`.
* Make a function to be called when any of the 9 buttons are tapped (hint: use @IBAction). Remember to hook the 9 buttons up to this function.
* When any of the buttons are pressed, this function should *change the image* of the pressed button. For now, randomly change the image to either "mark-x" or "mark-o" (hint1: use Boolean.random(). hint2: use `.setImage` with a state of `.normal`).
* This function should also print out the "button number" (hint: set the `tag` field in IB, and use `sender.tag` in code).
* That's all for now! We'll return to this function when we're implementing the game logic.

## Step 4: Set up the labels
* Go to the storyboard.
* Drag 4 `UILabel`s into your ViewController -- one for the title, one for each score field, and one as a "game status" label. Give them fake text for now.
* Try to match the look of the labels to what you see in the screenshot by changing the font size, weight, and alignment.
* Change the color of each label to something *other* than the default. Make sure the colors you choose adapt to darkmode changes.

## Step 5: Hook up the labels
* Go to `ViewController.swift`.
* Make an outlet variable for each `UILabel`.
* Connect the outlets from the storyboard.
* Back in `ViewController.swift`, test out the outlets by setting the `text` of each label whenever a button is tapped. This text can be whatever you want -- just demonstrate that a connection has been made.

## Step 6: Add a clear button
* In the storyboard, add a `UIButton`. Change its title to "Clear".
* Change the `tint` of the button to your favorite color (just not blue). Remember to use system colors.
* In `ViewController.swift` create a function to be called by the Clear button.
* In this function, we want to set the image of each button back to the image "mark-none" to clear the board. In order to do this, we'll need a reference to each of the 9 buttons... We could create an outlet variable for each button, but that would be messy -- instead, use an [IBOutlet collection](https://stackoverflow.com/questions/24805180/swift-put-multiple-iboutlets-in-an-array).
* At this point, tapping a button should randomly change it to an X or O. Tapping "clear" should set ALL buttons to the NONE state.

## Step 7: Sanity check
At this point your app should be crash free and support the following:
* Tapping a game grid button randomly changes it to a O or X, and updates each label to a different value of your choosing.
* Tapping the clear button sets each game grid button back to the NONE state.
* The buttons and labels should look roughly like they do in the screenshot.
* The app should compile and run in the simulator. It should not crash when any buttons are tapped.
* The app should look good in both light and darkmode.

## Submission
Zip your *entire project folder*. Do this in the Finder by finding the **highest level folder** named "app1_lastname_firstname" and zipping that. This folder should include **both** the .xcproject file and a subfolder also named "app1_lastname_firstname". 

We need both of these, make sure to zip them all! Name the zipped file app1a_lastname_firstname.zip and submit it on canvas.

Late submissions will be graded according to the policy described in Lecture 0. Please submit by the deadline!

---
# End of Part A
SUBMIT YOUR WORK TO THIS POINT on Canvas by Thursday, February 6th at **4:20pm**. Warning: missing this deadline will result in a late grade. Part B will be released on February 6th.
---
