# Tutorial 1: Life Cycle & MVC

Discuss this tutorial & get help on [Piazza](https://tiny.cc/cis195-piazza).
Please leave feedback by creating a GitHub issue or by posting on Piazza.

**Expected Duration:** < 1 hour


**Deadline:** Thursday, September 12th at **1:20pm**


⚠️ **Late submissions will be a zero starting with this Tutorial! Be sure to submit by the deadline.**

- - - -

## Objectives
* Understand the MVC paradigm and link back to work done in class
* Understand the Life Cycle of an app
* Understand the Life Cycle of a UIViewController
* Review Xcode and Interface Builder

#### Where are we in the learning process?  
During last class I introduced the Tic Tac Toe app. I also live coded a "Passcode" app, which has a very similar view structure. We saw how to connect our ViewController to the storyboard through the use of `IBOutlet`s and `IBAction`s. We also saw how to navigate the Xcode interface, and simulate apps on an iPhone simulator. In building Tic Tac Toe, you'll face questions about how your app should handle data, how user input should be handled, and more. This tutorial will formalize and solidify your understanding and help you answer these questions.

---

# Model-View-Controller (MVC)

The Model-View-Controller design pattern enables us to develop modular and extensible applications. The following video introduces the concept and how it is applied in iOS app development. 

As you watch, make sure to connect the concepts back to what we built in Recitation. "Passcode" wasn't complex enough to warrant a Model, but we did set up multiple connections between Controller and View.

Watch from 0:37 to 11:58:
[Stanford - Applying MVC](https://www.youtube.com/watch?v=w7a79cx3UaY&index=2&list=PLPA-ayBrweUzGFmkT_W65z64MoGnKRZMq)

### Do the following
* Create a new `.txt` file named `tut1_lastname_firstname.txt`.
* Summarize (in your own words) your interpretation of the roles of the Model, the View, and the Controller in an app’s structure. Write at least 1 paragraph (3-4 sentences) for each.
* Think about the Tic Tac Toe assignment you'll be completing. What will the Model, View, and Controller be? How will communication take place among them? Will you have an isolated Model, or will you combine the Model and Controller (up to you)! Your answer should be about one paragraph.

---

# View Controller Life Cycle

![](/tutorials/tutorial-1/assets/fig1.png?raw=true)

Any non-trivial iPhone app will have multiple screens. Those screens may appear and disappear many times while the app is running. It's important to "hook in" to this life cycle, and perform specific actions at specific times.

For example: when the view loads, we may want to make an API request. When the view appears, we may want to play an animation to welcome the user.

In general, you'll use the "Life Cycle" methods heavily to control your app.

Read: [Understand the View Controller Lifecycle](https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/WorkWithViewControllers.html). Stop at “Add a Meal Photo.”

Watch from 00:00 to 10:00: [Stanford - View Controller Life Cycle](https://www.youtube.com/watch?v=tLsPoVDXDG8&list=PLPA-ayBrweUzGFmkT_W65z64MoGnKRZMq&index=10)

*Optional reading: Similarly, apps have a life cycle too. Certain events happen to every app: app gets opened, app finished loading, app exited etc. [This article](https://medium.com/@neroxiao/ios-app-life-cycle-ec1b31cee9dc) describes the possible states your app can flow through. Don't worry if you don't understand everything on these diagrams - they're quite dense.*

![](/tutorials/tutorial-1/assets/fig2.png?raw=true)

You should understand the following:
* Apps have a predicted life cycle, governed by the different methods inside `AppDelegate`.
* View Controllers have a predicted life cycle, governed by the different life cycle methods in that view controller. Why is this important? You will want to make certain things happen in your app that will be require the view to be loaded, the view to actually appear (make sure you understand the distinction), disappear etc. **Having a firm grasp of this life cycle will make you write less buggy code, and make debugging much easier.**
* The life cycle methods provide predictable structure that stems directly from the way the iPhone loads and renders applications. These methods were provided to give iOS apps a way to react to "hook into" milestones in the life of the program.

### Do the following
* Open Xcode and create a new Single View Application. Name it whatever you like.
* Open `ViewController.swift` and examine the methods that were automatically included in the file.
* In your `.txt` file: which life cycle methods aren’t included in `ViewController.swift` by default?
Add those missing methods to `ViewController.swift` and place a **breakpoint** and a **print statement** with the function signature inside of each one (e.g. `print(“viewDidLoad()”)`). Breakpoints can be placed by clicking the code line number where you want the program to pause. More information [here](https://medium.com/yay-its-erica/xcode-debugging-with-breakpoints-for-beginners-5b0d0a39d711).
* Run your app in a simulator, continue between the breakpoints and examine the console output.
* In your .txt file: record the order in which the life cycle methods were called.
* In your .txt file: explain the differences between each of the differing life cycle methods. Give an example of when you might use each one. (HINT: check out [this link](https://www.codementor.io/hemantkumar434/view-controller-lifecycle-ios-applications-7oyju9lp6) if you’re having trouble, which explains these methods in layman's terms.)

---

# Submission
* Submit `tut1_lastname_firstname.txt` to Canvas.
* **Don't forget - there is no late policy for tutorials. Submit by the deadline!**


