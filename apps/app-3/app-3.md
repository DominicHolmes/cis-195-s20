# App 3: Newsfeed

Discuss this app & get help on [Piazza](https://tiny.cc/cis195-piazza).
Please leave feedback by creating a GitHub issue or by posting on Piazza.
Remember -- Stack Overflow and Google are encouraged, but DO NOT copy code. Ideas may be discussed with classmates, but don't work together.

While the last app had 2 parts, this app only has 1.

**Expected Duration:** 2+ hours.

**Deadlines:**
* Thursday, February 20th at **4:20pm**

- - - -

## Objectives
* Make your second app
* Learn about different table view methods
* Learn about taking text input from UIAlertController
* Implement advanced table view behavior like swipe-to-delete

![](/apps/app-3/assets/fig1.png?raw=true)

In this app, we'll implement a "newsfeed" of posts. Users will be able to add new posts, and they'll display with the most recent posts at the top. Users can also favorite posts and swipe-to-delete posts. 

We'll use this project to gain experience using table views. In this project, you'll be working off a starter template of stub methods.

## Topics

#### UIKit
* UINavigationController and UIBarButtonItem
* UITableViewController
* UITableViewCell
* UIAlertController

#### IB (Interface Builder)
* IBAction
* Dynamic prototype cells
* Using tags to control UITableViewCell content

---

# Part 1: Table View
## Step 0: Import the template code
* Dowload and unzip the [starter code](/apps/app-3/assets/app-3-starter.zip). I'm aware this xcode project is named "app2", but it's a bit difficult to change project names after the fact.
* Look through what has already been done for you. The storyboard contains a UITableViewController that has already been linked to `NewsfeedTableViewController.swift`. The *Asset catalog* contains 2 images, for each star state. Finally, a `NewsItem.swift` file has been created for you.
* Make sure the app compiles and runs.

## Step 1: Navigation bar and "+" button
* Go to `Main.storyboard` and select the TableViewController (click the yellow dot).
* On the top menu, select "Editor > Embed In.. > Navigation Controller" like so:
![](/apps/app-3/assets/fig2.png?raw=true)
* Now open the object library and search "BarButtonItem". Drag this object into the *right side* of the navigation bar at the top of your UITableViewController. Configure the bar button item to use the "Add" system item. Your app should now look like this:
![](/apps/app-3/assets/fig3.png?raw=true)
* Now we need to hook up the Add button to an IBAction - this action has already been defined in code for you. Just right-click-drag from the Add Button to the UITableViewController and select the "didSelectAdd:" method.
* Make sure this connection works - add a `print` statement inside the IBAction function in `NewsfeedTableViewController.swift`, and make sure it prints when you click the "+" button.

## Step 2: Cell UI
* Go to `Main.storyboard` and select the prototype cell in your table view.
* Give the cell an `identifier`.
* Drag a `UILabel` and a `UIImageView` into your cell. 
* Set the cell height to 100.
* Set the cell label text a larger typeface that looks nice. The screenshot uses "System Thin 32". The label should span most of the cell so that text is not clipped. *Give the label a "tag" value to identify it inside cellForRowAt*.
* Set the cell image view size to a reasonable size. *Give the image view a "tag" value to identify it inside cellForRowAt*.
* At this point, your storyboard should look like this:
![](/apps/app-3/assets/fig4.png?raw=true)

## Step 3: NewsItem
* Go to `NewsItem.swift`.
* Implement the simple model required for a cell in the table (Hint: we are storing a title and a "favorited" state. One of these can change, and one can't.)
* An array of `NewsItem`s is already created for you in `NewsfeedTableViewController.swift`.

## Step 4: Creating NewsItems
* Go to `NewsfeedTableViewController.swift`.
* Inside the @IBAction function for your "+" button, create and present a UIAlertController that includes a text field, a cancel button, and a done button.
* [This tutorial](https://www.hackingwithswift.com/example-code/uikit/how-to-add-a-uitextfield-to-a-uialertcontroller) should be helpful in creating a UIAlertController. Make sure to add an additional UIAlertAction for the "cancel" button.
* When the "Done" button is pressed, a new NewsItem should be created an added to the **beginning** of your newsItem array.
* Refresh the table view at this point. Nothing will appear yet though - first, we need to implement the table view methods.
* I recommend *against* using a didSet observer on `newsItems` to update the tableView. Although this may seem like a good approach, we want to have tight control over when exactly the table is refreshed.

## Step 5: Table View Methods
* Implement the 4 methods under "Basic table view methods" in `NewsfeedTableViewController.swift`.
* `heightForRowAt` already returns 100.0 - no changes necessary.
* Implement `numberOfRowsInSection`  - this should depend on your model (the `newsItems` array).
* Implement `numberOfSections`.
* Finally, implement `cellForRowAt`. Remember to `dequeCellWithIdentifier` to get table view cells, never create them yourself. The identifier cooresponds to the value you entered in the storyboard. Once you have a cell reference, you can access the views by using type casting and the `tag` property. For example: `if let label = cell.viewWithTag(49) as? UILabel { ... }`. You can use the `IndexPath.row` property to access the cooresponding value in your `newsItems` array.

## Step 6: Advanced Table View: Favorites
* Implement `didSelectRowAt` - when a user selects a cell, *deselect* that cell and toggle its favorited state (hint: if you use a Bool to store the favorited state, you can use the `.toggle()` method to flip the bool).
* Don't forget to refresh the table view after you make changes.

## Step 7: Advanced Table View: Swipe-To-Delete
* Implement `commitEditingStyle` - this method uses swipe-to-delete to remove cells from your model.
* Follow [this short guide](https://www.hackingwithswift.com/example-code/uikit/how-to-swipe-to-delete-uitableviewcells) to implement this.
* CAUTION: make sure you are first removing the item from your model, then calling `deleteRows`. Also make sure you aren't calling `tableView.reloadData()` anywhere at the same time - this will cause problems.

## Step 8: Sanity Check
At this point the following should be possible:
* Tapping "+" and inputing text will add a new cell, initially unfavorited, to your feed. New cells should be *added to the top of the feed*, not to the end.
* Tapping an existing cell will toggle its favorited state.
* Swipe to delete works on any cell.
* All of these actions work without crashing.

## Things to keep in mind
* We're only storing your model in local memory, so it will be deallocated with all data lost when the app is killed. Saving data between app sessions requires an extra step - we'll cover this later in the course.
* There are many features of table views we don't have to time to cover - for example: drag-to-rearrange functionality. I recommend exploring the UITableView documentation if you're interested in these extra features.
* We implemented swipe-to-delete, but in fact you can generalize this functionality into swipe-to-do-anything. You can provide your own colors, titles, and actions. This can be seen in the iOS mail app.

## Submission
Zip your *entire project folder*. Do this in the Finder by finding the **highest level folder** named "app-3-starter" and zipping that. This folder should include **both** the .xcproject file and all subfolders 

Name the zipped file app3_lastname_firstname.zip and submit it on canvas.

Late submissions will be graded according to the policy described in Lecture 1. Please submit by the deadline!
