# Tutorial 2: Table View and Delegation

Discuss this tutorial & get help on [Piazza](tiny.cc/cis195-piazza).
Please leave feedback by creating a GitHub issue or by posting on Piazza.

**Expected Duration:** 1.5 hours

**Deadline:** Thursday, February 13th at **4:20pm**


⚠️ **Late submissions will be a zero! Be sure to submit by the deadline.**

- - - -

## Objectives
* Understand protocols and delegation, and how they relate to what we've learned so far
* Understand the use of delegate methods in `UIScrollView` and `UITableView`
* Get some ideas of segues, and how to pass info between view controllers

#### Where are we in the learning process?  
So far we've been focusing on Swift fundamentals and getting used to the basics of iOS development. We've practiced building UI in Storyboard, and connecting that UI to our code with IBOutlets and IBActions. We've also learned about the MVC model and the life cycle of View Controllers -- all foundational knowledge for an iOS Engineer. We're now in a good position to dive deeper into the core components of iOS programming, starting with *protocols* and *delegation*. Delegation is used extensively to implement core UIViews like UIScrollView and UITableView, which we will be using in the next class and homework assignment.

---

## Protocols & Delegation

Protocols and Delegation provide a structured method of communication by which a View can talk to its Controller. For example:

![](/tutorials/tutorial-2/assets/fig1.png?raw=true)

Every option on your iPhone’s Settings app is a cell in a table view. When the user taps on the Wi-Fi cell, the table view needs to inform the Controller of this action, so that the Controller can present more options related to Wi-Fi. This form of communication from the View to the Controller occurs through Delegation.

The following video is from a lecture from the Stanford course on iOS programming. The lecture explains Protocols and Delegation in great depth, and then demonstrates their use in an app using a Scroll View. 

Watch: 
From 9:33 to 46:53  [1.5x speed recommended](https://youtu.be/GIlsl-6TqmM?list=PLPA-ayBrweUz32NSgNZdl0_QISw-f12Ai&t=573)

Do the following:
1.  Create a txt file called `tut2_lastname_firstname.txt`
2.  In your own words, what are the three aspects to a protocol? 
3.  What is the equivalent structure in Java known as?
4.  What is delegation, and how are protocols used in the delegation process? *Tip: Rewatch the video on MVC (From 5:29 to 8:38), which discusses how delegates and data sources fit into the MVC model.*


## Table Views & Collection Views
Now that you have read through the concepts of delegation in a UIScrollView, let’s learn about the UITableView, which is a special kind of scroll view. *This is an incredibly important part of iOS development.*

Watch: 
From 33:00 to 1:04:00 [1.5x speed recommended]
(https://www.youtube.com/watch?v=M3X9o9wbn9o&list=PLPA-ayBrweUzGFmkT_W65z64MoGnKRZMq&index=13)

The video will touch a little on segues. We covered a bit on segues during the view controller life cycle section in class. Think of them as a way of passing information and transitioning between view controllers. 

Read:
1.  Skim the Overview section in the Apple Documentation for [UITableView](https://developer.apple.com/documentation/uikit/uitableview).
2.  Skim through the table view delegate and datasource methods and their descriptions in the Apple Documentation for [UITableViewDelegate](https://developer.apple.com/documentation/uikit/uitableviewdelegate), and [UITableViewDataSource](https://developer.apple.com/documentation/uikit/uitableviewdatasource).

Do the following:
1. Adding to your `tut2_lastname_firstname.txt` file, note down 2 methods from UITableViewDelegate, and 3 from UITableViewDataSource, that you think are essential to create a fully functioning table view. If you think there are more methods that could be useful, note them down too!
2. For each method, describe in detail (2-3 sentences) what it does.

---

## Submission

* Submit `tut2_lastname_firstname.txt` on Canvas.
* **Don't forget - there is no late policy for tutorials. Submit by the deadline!**


