# Tutorial 3: AutoLayout

Discuss this tutorial & get help on [Piazza](https://tiny.cc/cis195-piazza).
Please leave feedback by creating a GitHub issue or by posting on Piazza.

**Expected Duration:** 40 minutes

**Deadline:** Thursday, February 20th at **4:20pm**

- - - -

## Objectives
* Get comfortable with organizing views on a Storyboard scene.
* Continue discovering Xcode.


#### Where are we in the learning process?  
In this tutorial, we will primarily take a look at how we might organize views on a storyboard scene, taking into account different screen sizes, so that you can design your own User Interfaces that would look great on all devices and in all orientations.

So far, the apps and projects we've built will only look good one *one screen size*. iPhones come in many different shapes and sizes, and we should make sure our apps look great on all of them!

---

## AutoLayout

Question: 
Why can’t we simply drag views onto a storyboard scene and trust they will appear in the same location on the device screen as they do in the Interface Builder?

Answer:
If you navigate to Main.storyboard in any of your past Xcode projects, you will notice a bar at the bottom which says “View as: <device type>”. For example, in my case, it is “View as: iPhone XR”. This means that as long as I run the app on this particular device type, I am fine with simply dragging and dropping views. However, nowadays, iPhones come in different screen sizes (in the past, it wasn’t the case!). As a result, we need some unambiguous rules to position our Views relative to the size of the device that the app is running on. AutoLayout makes this really easy for us to do.


#### Do the following:
* Read and (optionally) follow along with this [great tutorial](https://www.youtube.com/watch?v=emojd8GFB0o) (30 minutes, 1.5x speed recommended).

## Submission

* Nothing to submit this week! However I strongly recommend you follow along with the full tutorial - it will save you headaches next week.
