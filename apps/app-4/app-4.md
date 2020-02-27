# App 4: Profile

Discuss this app & get help on [Piazza](tiny.cc/cis195-piazza).
Please leave feedback by creating a GitHub issue or by posting on Piazza.
Remember -- Stack Overflow and Google are encouraged, but DO NOT copy code. Ideas may be discussed with classmates, but don't work together.

**Expected Duration:** 2+ hours.

**Deadlines:**
* Thursday, February 27th at **4:20pm**

- - - -

## Objectives
* Make your fourth app
* Practice using constraints
* Make a non-ambiguous, fully-constrained UI
* Use a GestureRecognizer
* Use the photo picker controls built into iOS

![](/apps/app-4/assets/fig1.png?raw=true)

![](/apps/app-4/assets/fig2.png?raw=true)

In this app, we'll implement a "profile page". The label text will be hardcoded, but users will be able to change their profile photo. You could imagine this app as being a single screen of a larger app.

We'll use this app to get practice with constraint layouts. Although I covered Autoresizing Masks (the easy way) in class, DO NOT use these for this assignment. Using Autolayout Contraints is **required**.

## Topics

#### UIKit
* NSConstraint
* UIImagePickerController
* UIImageView

#### IB (Interface Builder)
* Setting constraints
* Creating full-defined layouts

---

## Step 0: Create your project
* Create a new XCode project named `app4_lastname_firstname`
* If you're using XCode 11, make sure to select "Storyboards" rather than "SwiftUI".
* Compile the app and run it on a simulator.

## Step 1: Create UI elements
* Go to `Main.storyboard`.
* Drag 7 UILabels and 1 UIImageView into your view controller. Roughly position them to match the screenshot (no need to be exact, you'll constrain them later).
* Add some style! Set the text of each label to your own info, and change the font and color of each label:
    - Name label: *System Heavy 27.0, Dark Gray, center-aligned*
    - EMAIL, COMPANY, PHONE labels: *System Bold 16.0, Medium Gray, left-aligned*
    - Actual info labels: *System Regular 20.0, Black, left-aligned*

## Step 2: Constraints
* Set up your constraints such that your system is *fully defined and non-ambiguous*. Remember the lecture examples of what constitutes a fully defined system (rule of thumb: 2 horizontal & 2 vertical constraints).
* Some advice before you begin: I recommend drawing out all of these constraints on paper before you start, to make sure you understand the relationships.
* Constrain your views to achieve the following relationships:
    - The image view size is fixed at 150 by 150. It is centered, and the top edge is 50 points below the safe area.
    - The name label is 50 points tall, centered, and its top edge is 20 points below the image view. Its leading and trailing edges are 20 points from the safe area.
    - The remaining 6 labels are all 40 points tall, and are 20 points from the leading and trailing edges. In each *pair* of labels (Email, hdominic...), the bottom label's top edge is equal to the top label's bottom edge. The *space between each pair* is equal to 44 points.
* Your system should be free from errors, and it should work on all iPhone sizes. Try running the app on different simulators - your layout should adapt to different screens. (Note: this layout breaks on the iPhone SE, don't worry about that. We'll fix this with a scroll view next week.)
* Some advice if you're having trouble: constrain your views **one at a time**. Don't try to constrain one view while another is broken. Also, remember to not over-constrain: if label A's bottom is constrained to B's top, you do not need to add a second constraint from B's top back to A's bottom. This is overconstraining.


## Step 3: Gesture Recognizer
Now, we'll add the functionality to let users tap on their profile photo to change it.
* In the storyboard, find the UITapGestureRecognizer in the library, and drag it into your UIImageView.
* This will add a slot for the gesture recognizer in the space above your view controller:
![](/apps/app-4/assets/fig3.png?raw=true)
* Select the UIImageView, and check the box that says "User Interaction Enabled" in the attributes pane. This will tell UIKit to listen for touch events on this view, and send them to gesture recognizers.
![](/apps/app-4/assets/fig4.png?raw=true)
* Create an IBAction func in `ViewController.swift`. Hook up the gesture recognizer to this IBAction - for now, *print a value to make sure it works*.

## Step 4: UIImagePickerController
Finally, we're going to allow interaction with our ImageView. Users will be able to select an image from their photo library to set the profile image.
* First, style the UIImageView. *The corner radius step MUST be done programmatically with an IBOutlet* - the other steps can be done either in storyboards or programmatically.
    - Set the background color to a light color of your choice.
    - Set the content mode to "Aspect Fill"
    - Use corner radius to make the view a circle
        + This must be done programmatically with an IBOutlet (in ViewController.swift).
        + Use `imageView.layer.cornerRadius` to round the view.
        + You'll also have to set `imageView.clipsToBounds = true`
* Now, we'll create the image picker delegate methods.
    - In the definition line of your ViewController class, add protocol conformance to `UIImagePickerControllerDelegate` and `UINavigationControllerDelegate`. These conformances will come after the `UIViewController` conformance.
    - Add the delegate function `imagePickerController(_:didFinishPickingMediaWithInfo:)`. Notice we do NOT use "override func" in this case, just "func". (Why not?)
    - Inside the delegate function (this is called when an image is picked), you can access the picked image by unwrapping it: `if let selectedImage = info[.originalImage] as? UIImage { ... your code ...}`. Use this unwrapped image to update your image view. Inside that same function, you should call `dismiss(animated: true, completion: nil)` to dismiss the image picker view controller.
    - Your class is now fully compliant with the UIImagePicker delegate methods! Now, we just need to actually *create and present* the picker UI.
* Create and present the UIImagePickerController
    - The following code should be in its own function `presentImagePicker()`, and be called when the gesture recognizer is tapped.
    - First, create a picker controller: `let picker = UIImagePickerController()`
    - Set the `.sourceType` property of your picker to `.photoLibrary`.
    - Set the `.delegate` property of your picker to `self` (recall the lecture about delegates and protocols - why do we set this to self?).
    - Finally, call `present(_, animated: completion)`, passing in your picker. Animated should be true, and completion should be nil.
    - Build and run the app, and try to tap on the UIImageView.
* CRASH
    - Your app should crash, with a pretty opaque error. What's going on here?
    - We forgot something very important: asking for permission to view the user's photos. We'll fix this in Step 5.

## Step 5: Privacy and Permissions
iOS apps have many sensors that can give apps rich functionality. In addition to those sensors, there's a huge amount of historical user data that iOS apps can access - everything from location data, camera and photo data (with attached GPS locations!), bluetooth and wifi data, and even extremely sensitive health data. You can access all of this data, after requesting the right permissions from your user.

With great power comes great responsibility.

For example, your photos library is extremely sensitive. It contains potentially thousands of photos, with each one containing timestamp and GPS data. This could provide a map of where you live and where you work, to say nothing of the content of the photos themselves. For that reason, explicit consent is required before iOS grants access to photos.

The way this consent is *requested* by your app is through the `Info.plist` file. This is a configuration file packaged with your app. It contains lots of info about your app, including what sensitive data/sensors your app is planning to use.

To stop our app from crashing, we need to add a "usage description" to `Info.plist`:
* Click on the app xcodeproj file (the top-most blue file).
* Select your app target.
* Select the "Info" tab.
* Right click on any of the rows and select "Add Row".
* Type in "Privacy - Photo Library Usage Description" and select that option.
* You've filled in the "Key" - now select the "Value" field for your new row and type in a string description of why you need photo library access. This string is presented to the user in a dialog box. Something like "Select a profile picture from your photos library".
* This is what everything should look like:

![](/apps/app-4/assets/fig5.png?raw=true)

When you run the app again and tap on the image view, you should be asked for permission to access your photos library. When you allow access and select an image, the profile image view should be updated.

## Step 6: Sanity Check
* Your app should have a fully-defined layout that works on most iPhones (except the SE).
* Tapping the image view will allow you to select an image from the photos library.
* Nothing crashes.

## Things to keep in mind
* UIImagePickerController has other source types, including a "camera type". You can experiment with this, but be sure to add the appropriate privacy consent request to the `Info.plist`!
* If you wanted to provide options for both the camera and photo library, you could use an alert sheet. This is a specialized kind of UIAlertController, used to present different options.

## Submission
Zip your entire project folder. Do this in the Finder by finding the highest level folder named `app4_lastname_firstname` and zipping that. This folder should include both the `.xcproject` file and a subfolder also named `app4_lastname_firstname`.

We need both of these, make sure to zip them all! Name the zipped file `app4_lastname_firstname.zip` and submit it on canvas.

Late submissions will be graded according to the policy described in Lecture 1. Please submit by the deadline!

