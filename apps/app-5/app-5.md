# App 5: Contacts

Discuss this app & get help on [Piazza](tiny.cc/cis195-piazza).
Please leave feedback by creating a GitHub issue or by posting on Piazza.
Remember -- Stack Overflow and Google are encouraged, but DO NOT copy code. Ideas may be discussed with classmates, but don't work together.

**Expected Duration:** 2+ hours.

**Deadlines:**
* Thursday, March 5th at **4:20pm**

- - - -

## Objectives
* Make your fourth app
* Combine all of your experience so far into one app
* Make a non-ambiguous, fully-constrained UI
* Transition between multiple screens while passing data between them
* Create your own protocol, and conform to it

![](/apps/app-5/assets/fig1.png?raw=true)

## User Story
In this app, we'll implement a contacts app. The initial controller will be a list of contacts, initially displaying two hardcoded contacts. Tapping the "+" button in the navigation bar will present a controller to add a new contact. Tapping "Save" on the AddContact controller will save the contact and dismiss AddContact, returning to the initial controller. The contact you added will now be a cell on the initial table controller. Tapping that cell will display a Detail controller that displays all contact info.

All controllers must be fully-constrained and adapt to different screen sizes.

## Topics

#### UIKit
* UITableViewController
* UITextField
* UIImageView
* UIImagePicker
* UINavigationController
* UIBarButtonItem

#### IB (Interface Builder)
* Creating and executing segues
* Embedding view controllers inside navigation controllers

---

## Legend
* CTVC == ContactsTableViewController
* ACVC == AddContactViewController
* DVC == DetailViewController

## Step 0: Create your project
* Create a new XCode project named `app5-Firstname-Lastname`
* If you're using XCode 11, make sure to select "Storyboards" rather than "SwiftUI".
* Compile the app and run it on a simulator.

## Step 1: Create the UI structure
* Go to `Main.storyboard`.
* Delete the intial view controller.
* Drag a UITableViewController into the scene. I'll refer to this as the ContactsTableViewController (CTVC). Embed the CTVC in a UINavigationController, and set the nav controller as the "initial view controller".
* Run the app again, and make sure the CTVC loads correctly.

## Step 2: Segues
* Drag two more view controllers into the scene. One of these will be the DetailViewController (DVC) and one will be AddContactViewController (ACVC).
* Embed the ACVC in another navigation view controller.
* Create a **modal segue** between CTVC and ACVC's navigation controller. Remember to give this segue an identifier.
* Create a **show segue** between CTVC and DVC. Remember to give this segue an identifier.
* Create `.swift` files for all three view controllers, and add a skeleton implementation for each (just the `class DetailViewController: UIViewController {}` part). Make sure CTVC is of type UITableViewController.
* Delete the `ViewController.swift` file - we don't need it anymore.
* In the storyboard, set the custom class of each controller to match the new classes.
* Set the title property of each view controller.
* Run the app, and make sure it loads.

![](/apps/app-5/assets/fig2.png?raw=true)
Your app structure should look something like this. If it doesn't, consult a TA.

## Step 3: Navigation UI
In the following steps, we'll be using a class called UIBarButtonItem. This class is similar to UIButton, but it can only be used inside navigation bars. UIBarButtonItems also comes with lots of useful presets.
* Drag a BarButtonItem into the *navigation bar at the top of CTVC* on the right side. Set the `System Item` property to "Add".
* Create an IBAction method on CTVC (triggered by the Add button) that performs the segue to ACVC.
* Drag a BarButtonItem into the *navigation bar at the top of ACVC* on the left side. Set the `System Item` property to "Cancel".
* Drag a BarButtonItem into the *navigation bar at the top of ACVC* on the right side. Set the `System Item` property to "Save".
* Hook up these 2 items to seperate IBAction functions. In both functions, just call `dismiss(animated: true, completion: nil)`. We'll change the implementation of the Save function later.
* Test the app - make sure you can open and dismiss the ACVC by tapping +, then Cancel.

## Step 4: Add Contacts UI
* Drag 5 UITextFields into your ACVC. Set their `placeholder` property to match the look of the screenshot.
* Create an outlet for each text field.
* Constrain the text fields to roughly match the look of the screenshot. You can use either Autoresizing Masks or Autolayout Constraints to do this. 

## Step 5: Define your model
* Create a `.swift` file containing the model for your Contact struct. Each contact should represent a row in the table view. To figure out what fields you need, examine what is displayed in the screenshots. Remember to also include an *optional* UIImage property. All other fields should be non-optional and required.
* Create an array in CTVC that holds a list of all contacts. Initialize this array with 2 initial contacts: one for you, and one for a friend. You'll use these to test your table view implementation.
* Set up your CTVC's table view methods to display the contents of your contacts array. *You may use App 2 as a reference*.
* You may use the "Subtitle" style of UITableView cell to achieve the look in the screenshot. Set this in storyboard. After doing so, the subtitle label can be accessed with the `cell.detailTextLabel` property inside `cellForRowAt`.

## Step 6: The Detail Screen
* Implement `tableViewDidSelectRowAt` in CTVC; when a row is tapped, you should peform the *show segue* to DVC. Use `prepareForSegue` to pass the data from CTVC to DVC.
* Create the UI of DVC, and ensure that the labels are reflect the contents of the passed Contact object. *You may use App 3 as a reference for DVC's UI.*
* Test the app; make sure you can tap on one of your default contacts and see detailed info about the contact on DVC. You should also be able to return to CTVC with the automatically-provided back button.

## Sanity Check
That was a lot! Let's check our progress.
* At this point, your app UI should be fully set up and fully defined. It should work on any typical screen size.
* The DVC is functional (apart from the image view, which should display a default grey background).
* The CTVC displays the content of the `contacts` array.
* The ACVC UI is set up and the segues work, but it is not yet functional (it doesn't actually create a contact). Next, we'll add this functionality.

## Step 7: The Add Contact Screen
First, we should figure out how to create a `Contact` object when the Save button is tapped on ACVC.
* Create a function `createNewContact() -> Contact?` which uses the IBOutlets of the text fields to create a new Contact. Because the user may have forgotten to fill out a field, this should return an Optional Contact (nil if any fields are empty).
* Now, try creating a contact. When the save button is tapped, `dump()` the created Contact and dismiss the view. Check that this works.

## Step 8: Passing Data with Protocols
We'll now use a `protocol` to pass data from ACVC back to CTVC when the save button is tapped.
* Inside `AddContactViewController.swift`, above the class definition, create a new protocol:
```
protocol AddContactDelegate: class {
    func didCreate(_ contact: Contact)
}
```
* This is a *class* protocol, which means that only classes can adopt this protocol. This allows us to establish a *weak* connection, which ensures we do not accidentally create a reference cycle. Put simply: if two view controllers have references to each other, neither can ever be deallocated. Using the `weak` keyword avoids this situation (this is also why we use `@IBOutlet weak var`).
* Inside ACVC, add a delegate variable to AddContactViewController:
```
class AddContactViewController {
    // ...
    weak var delegate: AddContactDelegate?
    // ...
}
```
* Great! We've now created a protocol that ACVC uses to communicate the creation of new Contact objects. Notice that ACVC doesn't know or care about the view controller *adopting* the AddContactDelegate protocol; it only knows that the function `didCreate` is implemented.

* Finally, let's use this delegate method in the "Save" button IBAction function. When Save is tapped, we should check if `createNewContact()` creates a valid contact. If it does, call `self.delegate?.didCreate(newContact)`, passing in the newly created Contact. This function should no longer `dismiss` the controller.
* Build and test the app.
* The save button should correctly create a new contact, but it isn't passing it back to the CTVC. What went wrong? We still need to *conform* CTVC to AddContactDelegate. Also, we need to set the `.delegate` property of ACVC to point back to CTVC.

## Step 9: Conforming to AddContactDelegate
* Inside CTVC, add a protocol conformance to AddContactDelegate.
* This will force you to implement the `didCreate` func in CTVC. Implement this function, which should do the following things:
1. Dismiss the ACVC with `dismiss(...)`.
2. Add the new contact to the contacts array.
3. Sort the array alphabetically by last name.
4. Reload the table view.
* Lastly, we need to add the set the `.delegate` property of ACVC to `self` from *inside CTVC*. You should do this inside CTVC's `prepareForSegue` method. Remember to use the segue identifiers to tell your 2 segues apart. Also recall that the `seque.destination` is of type UINavigationController for the ACVC segue, so you'll need to use the `.topViewController` property of the NVC to get a reference to ACVC.

## Sanity Check
At this point the app should be fully functional. Tapping "Save" on the ACVC without valid information will do nothing. If the information is valid, the contact is saved, the controller is dismissed, and the table view is reloaded. Tapping any of the contact cells displays that contact in detail on the DVC.

![](/apps/app-5/assets/fig3.png?raw=true)

## Bonus Steps
These steps are NOT required and no extra credit is given. They are just ways you can improve the app if you'd like a little extra challenge!
* Allow user to set a contact photo by tapping the UIImageView on DetailVC. You'll have to set up another protocol to alert CTVC of the model change.
* Do more rigorous checking on the text field content to make sure the phone number and other fields are well-formed.

## Submission
Zip your *entire project folder*. Do this in the Finder by finding the **highest level folder** named "app5_lastname_firstname" and zipping that. This folder should include **both** the .xcproject file and a subfolder also named "app5_lastname_firstname". 

We need both of these, make sure to zip them all! Name the zipped file app5_lastname_firstname.zip and submit it on canvas.

Late submissions will be graded according to the policy described in Lecture 1. Please submit by the deadline!
