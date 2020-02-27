# Tutorial 4: Segues

Discuss this tutorial & get help on [Piazza](https://piazza.com/upenn/fall2019/cis195201/home).
Please leave feedback by creating a GitHub issue or by posting on Piazza.

**Expected Duration:** <1 hour

* Thursday, February 27th at **4:20pm**

- - - -

## Objectives
* Get comfortable with creating multi-screen apps.

Where are we in the learning process?
* After last week’s tutorial on Autolayout, we now have all the essential tools required to build complex and useful apps. It's a perfect time to learn about segues, so that we can start building apps with multiple ViewControllers. We've almost completed our "toolkit" of core iOS skills.

---

## An Introduction to Segues
Let’s kick off this tutorial with a brief explanation of what segues are, and how they work in iOS.

Watch [this video](https://www.youtube.com/watch?v=5B5IRK9wYjI&index=8&list=PLPA-ayBrweUzGFmkT_W65z64MoGnKRZMq) from 15:38 to 25:00 for understanding segues. Continue the video for an implementation example (2x recommended).
 
## Types and Use Cases of Basic Segues
Now that we have an idea of what segues are, let’s look at the types of segues that exist in XCode, and when are possible uses cases of each one.

Read [this blog post](https://digitalleaves.com/segues-navigation-ios-basics/) (and keep it handy).

## Navigation Controllers
The UINavigationController is one of the most important classes in UIKit, used in almost every app. Its a very common way of navigating between different scenes in an app. It is used when you want to present different scenes, and pass data between those views in a sequential way. Let’s start by reading the Apple documentation, to understand what a Navigation Controller is, and what it can do.

Read: [Apple Developer Documentation on UINavigationController](https://developer.apple.com/documentation/uikit/uinavigationcontroller) up to State Preservation. Don't worry if you don't understand all the concepts presented.

By now, you should have realized that you’ve interacted with Navigation Controllers in almost every app on your iPhone. Optionally, you can read through [this tutorial](https://guides.codepath.com/ios/Navigation-Controller-Quickstart#step-1-embed-root-view-controller-inside-a-navigation-controller) to see how navigation controllers are implemented in storyboards. That tutorial also includes the "programmatic" (non-storyboard) way to do this, feel free to ignore that section.

## Unwind Segues
Unwind segues are quite useful when you want to go back many scenes at once in a navigation stack.

---

## Submission
* Create an app that contains two view controllers, such that clicking on a button in the initial view controller segues to the second view controller. Make use of a Navigation Controller to embed these two view controllers in a navigation stack. The optional tutorial above is useful if you have trouble with this.
* Compress the project folder, rename it to `tutorial4_lastname_firstname.zip`, and submit the zipped file on Canvas by the due date.


